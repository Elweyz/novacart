package com.novacart.novacart.controller;

import com.novacart.novacart.model.DetallePedido;
import com.novacart.novacart.model.Producto;
import com.novacart.novacart.repository.DetallePedidoRepository;
import com.novacart.novacart.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api/detalle-pedido")
@CrossOrigin(origins = "*")
public class DetallePedidoController {

    @Autowired private DetallePedidoRepository detalleRepo;
    @Autowired private ProductoRepository productoRepo;

    @GetMapping("/{pedidoId}")
    public List<Map<String, Object>> obtenerDetalle(@PathVariable Long pedidoId) {
        List<DetallePedido> detalles = detalleRepo.findByPedidoId(pedidoId);
        List<Map<String, Object>> resultado = new ArrayList<>();

        for (DetallePedido d : detalles) {
            Map<String, Object> item = new HashMap<>();
            item.put("cantidad", d.getCantidad());
            item.put("precioUnitario", d.getPrecioUnitario());
            productoRepo.findById(d.getProductoId()).ifPresent(p -> {
                item.put("nombre", p.getNombre());
                item.put("imagenUrl", p.getImagenUrl());
            });
            resultado.add(item);
        }
        return resultado;
    }
}