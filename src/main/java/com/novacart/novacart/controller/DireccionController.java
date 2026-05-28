package com.novacart.novacart.controller;

import com.novacart.novacart.model.Direccion;
import com.novacart.novacart.repository.DireccionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/direcciones")
@CrossOrigin(origins = "*")
public class DireccionController {

    @Autowired
    private DireccionRepository direccionRepo;

    @GetMapping("/usuario/{usuarioId}")
    public List<Direccion> listar(@PathVariable Long usuarioId) {
        return direccionRepo.findByUsuarioId(usuarioId);
    }

    @PostMapping
    public ResponseEntity<Direccion> guardar(@RequestBody Direccion direccion) {
        return ResponseEntity.ok(direccionRepo.save(direccion));
    }
}