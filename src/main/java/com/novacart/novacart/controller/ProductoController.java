package com.novacart.novacart.controller;

import com.novacart.novacart.model.Producto;
import com.novacart.novacart.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/productos")
@CrossOrigin(origins = "*")
public class ProductoController {

    @Autowired
    private ProductoRepository productoRepo;

    @GetMapping
    public List<Producto> listar() {
        return productoRepo.findAll();
    }

    @PostMapping
    public Producto crear(@RequestBody Producto producto) {
        return productoRepo.save(producto);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Producto> actualizar(@PathVariable Long id, @RequestBody Producto datos) {
        return productoRepo.findById(id).map(p -> {
            p.setNombre(datos.getNombre());
            p.setPrecio(datos.getPrecio());
            p.setStock(datos.getStock());
            p.setImagenUrl(datos.getImagenUrl());
            return ResponseEntity.ok(productoRepo.save(p));
        }).orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        if (!productoRepo.existsById(id)) return ResponseEntity.notFound().build();
        productoRepo.deleteById(id);
        return ResponseEntity.ok().build();
    }
}