package com.novacart.novacart.controller;

import com.novacart.novacart.model.Usuario;
import com.novacart.novacart.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/usuarios")
@CrossOrigin(origins = "*")
public class UsuarioController {

    @Autowired
    private UsuarioRepository usuarioRepo;

    @PostMapping("/registro")
    public ResponseEntity<String> registro(@RequestBody Usuario usuario) {
        if (usuarioRepo.findByUsuario(usuario.getUsuario()).isPresent()) {
            return ResponseEntity.badRequest().body("Este correo ya está registrado.");
        }
        usuarioRepo.save(usuario);
        return ResponseEntity.ok("Cuenta creada exitosamente.");
    }

    @PostMapping("/login")
    public ResponseEntity<Usuario> login(@RequestBody Usuario credenciales) {
        Optional<Usuario> usuario = usuarioRepo.findByUsuario(credenciales.getUsuario());
        if (usuario.isPresent() && usuario.get().getPassword().equals(credenciales.getPassword())) {
            return ResponseEntity.ok(usuario.get());
        }
        return ResponseEntity.status(401).build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Usuario> obtenerUsuario(@PathVariable Long id) {
        return usuarioRepo.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}