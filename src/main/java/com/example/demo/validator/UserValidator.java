package com.example.demo.validator;

import org.springframework.stereotype.Component;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class UserValidator {

    public boolean checkFirstAndLastName(String userFirstAndLastName){
        Pattern p = Pattern.compile("[a-zA-Z]{1,16}");
        Matcher m = p.matcher(userFirstAndLastName);
        return m.matches();
    }
    public boolean checkUserName(String userNameString){
        Pattern p = Pattern.compile("[a-zA-Z]{3,16}");
        Matcher m = p.matcher(userNameString);
        return m.matches();
    }
    public boolean checkPasswordName(String userNameString){
        Pattern p = Pattern.compile("(?=.*[0-9])(?=.*[!@#$%+=\\)(^&*])(?=.*[a-z])[0-9a-zA-Z!@#$%+=\\)(^&*]{3,16}");
        Matcher m = p.matcher(userNameString);
        return m.matches();
    }

}
