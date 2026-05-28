package com.novacart.novacart.controller;

import com.novacart.novacart.model.DetallePedido;
import com.novacart.novacart.model.Pedido;
import com.novacart.novacart.model.Producto;
import com.novacart.novacart.repository.DetallePedidoRepository;
import com.novacart.novacart.repository.PedidoRepository;
import com.novacart.novacart.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/checkout")
@CrossOrigin(origins = "*")
public class CheckoutController {

    @Autowired private ProductoRepository productoRepo;
    @Autowired private PedidoRepository pedidoRepo;
    @Autowired private DetallePedidoRepository detalleRepo;

    @PostMapping("/procesar/{usuarioId}")
    public ResponseEntity<String> procesar(@PathVariable Long usuarioId,
                                           @RequestBody List<Map<String, Integer>> items) {
        double total = 0;

        for (Map<String, Integer> item : items) {
            Long productoId = Long.valueOf(item.get("productoId"));
            int cantidad = item.get("cantidad");

            Optional<Producto> opt = productoRepo.findById(productoId);
            if (opt.isEmpty() || opt.get().getStock() < cantidad) {
                return ResponseEntity.badRequest().body("Stock insuficiente para un producto.");
            }
            total += opt.get().getPrecio() * cantidad;
        }

        Pedido pedido = new Pedido();
        pedido.setUsuarioId(usuarioId);
        pedido.setTotal(total);
        pedidoRepo.save(pedido);

        for (Map<String, Integer> item : items) {
            Long productoId = Long.valueOf(item.get("productoId"));
            int cantidad = item.get("cantidad");
            Producto p = productoRepo.findById(productoId).get();

            DetallePedido detalle = new DetallePedido();
            detalle.setPedidoId(pedido.getId());
            detalle.setProductoId(productoId);
            detalle.setCantidad(cantidad);
            detalle.setPrecioUnitario(p.getPrecio());
            detalleRepo.save(detalle);

            p.setStock(p.getStock() - cantidad);
            productoRepo.save(p);
        }

        return ResponseEntity.ok("¡Compra realizada con éxito! Tu pedido #" + pedido.getId() + " está en camino.");
    }
}