package com.novacart.novacart.controller;

import com.novacart.novacart.model.Pedido;
import com.novacart.novacart.repository.PedidoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cuenta")
@CrossOrigin(origins = "*")
public class CuentaController {

    @Autowired
    private PedidoRepository pedidoRepo;

    @GetMapping("/pedidos/{usuarioId}")
    public List<Pedido> historial(@PathVariable Long usuarioId) {
        return pedidoRepo.findByUsuarioId(usuarioId);
    }

    @GetMapping("/pedidos/todos")
    public List<Pedido> todosPedidos() {
        return pedidoRepo.findAll();
    }
}