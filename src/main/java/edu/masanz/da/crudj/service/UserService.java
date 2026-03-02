package edu.masanz.da.crudj.service;

import edu.masanz.da.crudj.dao.UserDaoDb;
import edu.masanz.da.crudj.dto.User;

public class UserService {

    private UserDaoDb userDao = new UserDaoDb();

    public User login(String email, String password) {

        User user = userDao.obtenerPorEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            return user;
        }

        return null;
    }

}