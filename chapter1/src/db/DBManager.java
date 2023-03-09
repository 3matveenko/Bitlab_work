package db;

import model.User;

import java.util.ArrayList;

public class DBManager {


    private static ArrayList<User> users = new ArrayList<>();
    private static int id = 0;

    public static ArrayList<User> getUsers() {
        return users;
    }

    public static boolean addUser(User user) {

        for (User u : users) {
            if (u.getEmail().equals(user.getEmail())) {
                return false;
            }
        }
        user.setId(id);
        id++;
        users.add(user);

        return true;
    }

    public static Boolean searchUser(User user) {
        for (User u : users) {
            if (u.getEmail().equals(user.getEmail())) {
                if (u.getPassword().equals(user.getPassword())) {
                    return true;
                }
                return null;
            }
        }
        return false;
    }

    public static User findById(int id) {
        for (User u : users) {
            if (u.getId() == id) {
                return u;
            }
        }
        return null;
    }

    public static void deleteById(int id) {
        for (int i=0;i<users.size();i++) {
            if (users.get(i).getId() == id) {
                users.remove(users.get(i));
            }
        }
    }

    public static void updateUser(User user) {
        for (User u : users) {
            if (u.getId() == user.getId()) {
                u.setFullname(user.getFullname());
                u.setEmail(user.getEmail());
                u.setGender(user.getGender());
                u.setPassword(user.getPassword());
                u.setAge(user.getAge());
            }
        }
    }
}
