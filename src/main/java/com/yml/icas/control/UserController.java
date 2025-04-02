package com.yml.icas.control;

import com.yml.icas.model.User;
import com.yml.icas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;

    // ✅ Add new user
    @PostMapping("/create")
    public ResponseEntity<User> createUser(@RequestBody UserDTO userDTO) {
        User user = userService.createUser(userDTO.getEmpNo(), userDTO.getPassword(), userDTO.getRoles());
        return ResponseEntity.ok(user);
    }

    // 🔑 Update password
    @PutMapping("/{empNo}/password")
    public ResponseEntity<User> updatePassword(@PathVariable String empNo, @RequestBody PasswordDTO passwordDTO) {
        User user = userService.updatePassword(empNo, passwordDTO.getNewPassword());
        return ResponseEntity.ok(user);
    }

    // 🗑 Delete user
    @DeleteMapping("/{empNo}")
    public ResponseEntity<String> deleteUser(@PathVariable String empNo) {
        userService.deleteUser(empNo);
        return ResponseEntity.ok("User deleted successfully");
    }

    // ➕ Add roles to a user
    @PostMapping("/{empNo}/roles/add")
    public ResponseEntity<User> addRoles(@PathVariable String empNo, @RequestBody RolesDTO roleDTO) {
        User user = userService.addRolesToUser(empNo, roleDTO.getRoles());
        return ResponseEntity.ok(user);
    }

    // ❌ Remove roles from a user
    @PostMapping("/{empNo}/roles/remove")
    public ResponseEntity<User> removeRoles(@PathVariable String empNo, @RequestBody RolesDTO roleDTO) {
        User user = userService.removeRolesFromUser(empNo, roleDTO.getRoles());
        return ResponseEntity.ok(user);
    }
}

