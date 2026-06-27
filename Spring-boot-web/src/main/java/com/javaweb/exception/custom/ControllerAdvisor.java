package com.javaweb.exception.custom;

import com.javaweb.exception.CustomerException;
import com.javaweb.exception.ServiceException;
import com.javaweb.exception.UserException;
import com.javaweb.exception.UsernameException;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class ControllerAdvisor extends ResponseEntityExceptionHandler {
    @ExceptionHandler(ServiceException.class)
    public ResponseEntity<ResponseDTO> handleInvalidDataException(ServiceException ex) {
        ResponseDTO error = new ResponseDTO();
        error.setMessage("Dữ liệu đầu vào không hợp lệ");
        error.setDetail(ex.getMessage());
        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(UsernameException.class)
    public ResponseEntity<ResponseDTO> handleInvalidUsernameException(UsernameException ex) {
        ResponseDTO error = new ResponseDTO();
        error.setMessage("Username không hợp lệ!");
        error.setDetail(ex.getMessage());
        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(CustomerException.class)
    public ResponseEntity<ResponseDTO> handleInvalidCustomerException(CustomerException ex) {
        ResponseDTO error = new ResponseDTO();
        error.setMessage("Customer không hợp lệ!");
        error.setDetail(ex.getMessage());
        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(UserException.class)
    public ResponseEntity<ResponseDTO> handleInvalidUserException(UserException ex) {
        ResponseDTO error = new ResponseDTO();
        error.setMessage("User không hợp lệ!");
        error.setDetail(ex.getMessage());
        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
    }
}
