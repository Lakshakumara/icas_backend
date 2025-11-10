package com.yml.icas.control;

import com.yml.icas.dto.MessageResponse;
import com.yml.icas.dto.RoleDTO;
import com.yml.icas.model.Role;
import com.yml.icas.model.User;
import com.yml.icas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;


    // Add new user
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

    // Delete user
    @DeleteMapping("/{empNo}")
    public ResponseEntity<String> deleteUser(@PathVariable String empNo) {
        userService.deleteUser(empNo);
        return ResponseEntity.ok("User deleted successfully");
    }

    // Add roles to a user
    @PostMapping("/{empNo}/roles/add")
    public ResponseEntity<User> addRoles(@PathVariable String empNo, @RequestBody RolesDTO roleDTO) {
        User user = userService.addRolesToUser(empNo, roleDTO.getRoles());
        return ResponseEntity.ok(user);
    }

    // Remove roles from a user
    @PostMapping("/{empNo}/roles/remove")
    public ResponseEntity<User> removeRoles(@PathVariable String empNo, @RequestBody RolesDTO roleDTO) {
        User user = userService.removeRolesFromUser(empNo, roleDTO.getRoles());
        return ResponseEntity.ok(user);
    }

    @PostMapping("/{empNo}/roles/update")
    ResponseEntity<?> updateRoles(@PathVariable String empNo, @RequestBody UpdateRolesRequest roles) {
        System.out.println("received "+empNo+" "+roles.getRoles());
        User user = userService.updateUserRoles(empNo, roles.getRoles());
        /*Member member = memberRepo.findByEmpNo(empNo).orElseThrow(() -> new RuntimeException("Member not found"));
        String email = member.getEmail();
        Map<String, Object> variables = new HashMap<>();
        variables.put("name", member.getName());
        variables.put("roles", roles);

        emailService.sendEmail(email, "Role Updated", "role-update", variables);
        */
        return ResponseEntity.ok(new MessageResponse("Roles Added Successfully"));
    }

    @GetMapping(path = "/{empNo}/roles/get")
    ResponseEntity<List<RoleDTO>> getUserRoles(@PathVariable(name = "empNo") String empNo) {
        Set<Role> roles = userService.getUserRoles(empNo);
        return ResponseEntity.ok(roles.stream().map(role->new RoleDTO(role.getRole())).toList());
    }
}

