package com.thinkgem.jeesite.restful;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.junit.Test;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.util.LinkedHashMap;
import java.util.List;

public class SpringRestTestClient {

    //测试时需要把DemoControllerApi中@RequestMapping(value = "/api/userDemo",headers="api-version=v1")
    //修改为@RequestMapping(value = "/api1/userDemo"),跳过shiro层;
    public static final String REST_SERVICE_URI = "http://localhost:8080/api1/userDemo";

    /* GET */  
    @SuppressWarnings("unchecked")
    @Test
    public void listAllUsers(){
        System.out.println("Testing listAllUsers API-----------");  
           
        RestTemplate restTemplate = new RestTemplate();
        List<LinkedHashMap<String, Object>> usersMap = restTemplate.getForObject(REST_SERVICE_URI+"/", List.class);
           
        if(usersMap!=null){  
            for(LinkedHashMap<String, Object> map : usersMap){  
                System.out.println("User : id="+map.get("id")+", Name="+map.get("name"));
            }  
        }else{  
            System.out.println("No user exist----------");  
        }  
    }  
       
    /* GET */
    @Test
    public void getUser(){
        System.out.println("Testing getUser API----------");  
        RestTemplate restTemplate = new RestTemplate();  
        User user = restTemplate.getForObject(REST_SERVICE_URI+"/1", User.class);
        System.out.println(user);  
    }  
       
    /* POST */
    @Test
    public void createUser() {
        System.out.println("Testing create User API----------");  
        RestTemplate restTemplate = new RestTemplate();  
        User user = new User("1","Sarah");
        URI uri = restTemplate.postForLocation(REST_SERVICE_URI+"/", user, User.class);
        System.out.println("Location : "+uri.toASCIIString());  
    }  
   
    /* PUT */
    @Test
    public void updateUser() {
        System.out.println("Testing update User API----------");  
        RestTemplate restTemplate = new RestTemplate();  
        User user  = new User("1","thinkgem");
        restTemplate.put(REST_SERVICE_URI+"/user/1", user);  
        System.out.println(user);  
    }  
   
    /* DELETE */
    @Test
    public void deleteUser() {
        System.out.println("Testing delete User API----------");  
        RestTemplate restTemplate = new RestTemplate();  
        restTemplate.delete(REST_SERVICE_URI+"/3");
    }  
   
   
    /* DELETE */
    @Test
    public void deleteAllUsers() {
        System.out.println("Testing all delete Users API----------");  
        RestTemplate restTemplate = new RestTemplate();  
        restTemplate.delete(REST_SERVICE_URI+"/");
    }  
   
    /*public static void main(String args[]){
        listAllUsers();  
        getUser();  
        createUser();  
        listAllUsers();  
        updateUser();  
        listAllUsers();  
        deleteUser();  
        listAllUsers();  
        deleteAllUsers();  
        listAllUsers();  
    }  */
}  