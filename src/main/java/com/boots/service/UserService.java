package com.boots.service;

import com.boots.entity.Role;
import com.boots.entity.User;
import com.boots.repository.RoleRepository;
import com.boots.repository.UserRepository;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }
    public User findUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public boolean updateUser(User updatedUser) {
        User userFromDB = userRepository.findById(updatedUser.getId()).orElse(null);
        if (userFromDB != null) {
            userFromDB.setFirstName(updatedUser.getFirstName());
            userFromDB.setLastName(updatedUser.getLastName());
            userFromDB.setPhoneNumber(updatedUser.getPhoneNumber());
            userFromDB.setEmail(updatedUser.getEmail());
            userFromDB.setAvatar(updatedUser.getAvatar());
            userFromDB.setAge(updatedUser.getAge());
            userFromDB.setCity(updatedUser.getCity());
            userFromDB.setRegion(updatedUser.getRegion());
            userFromDB.setAbout(updatedUser.getAbout());
            userFromDB.setWant(updatedUser.getWant());
            userFromDB.setTeleg(updatedUser.getTeleg());
            userRepository.save(userFromDB);
            return true;
        }
        return false;
    }

    public List<User> filterUsers(String age, String city, String region, String want) {
        List<User> users = userRepository.findAll();

        if (age != null && !age.isEmpty()) {
            users = users.stream()
                    .filter(user -> user.getAge() != null && user.getAge().equals(age))
                    .collect(Collectors.toList());
        }

        if (city != null && !city.isEmpty()) {
            users = users.stream()
                    .filter(user -> user.getCity() != null && user.getCity().equalsIgnoreCase(city))
                    .collect(Collectors.toList());
        }

        if (region != null && !region.isEmpty()) {
            users = users.stream()
                    .filter(user -> user.getRegion() != null && user.getRegion().equalsIgnoreCase(region))
                    .collect(Collectors.toList());
        }

        if (want != null && !want.isEmpty()) {
            users = users.stream()
                    .filter(user -> user.getWant() != null && user.getWant().equalsIgnoreCase(want))
                    .collect(Collectors.toList());
        }
        users = users.stream()
                .filter(user -> user.getRoles().stream().noneMatch(role -> role.getName().equals("ROLE_ADMIN")))
                .collect(Collectors.toList());
        return users;
    }


    public List<User> allUsers() {
        return userRepository.findAll();
    }

    public boolean saveUser(User user) {
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }


    public boolean deleteUser(Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public List<User> usergtList(Long idMin) {
        return em.createQuery("SELECT u FROM User u WHERE u.id > :paramId", User.class)
                .setParameter("paramId", idMin).getResultList();
    }
}
