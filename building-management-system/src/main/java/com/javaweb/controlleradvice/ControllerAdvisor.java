package com.javaweb.controlleradvice;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.javaweb.customexceptions.InvalidDataException;
import com.javaweb.dto.ErrorDetailDTO;

@ControllerAdvice
public class ControllerAdvisor extends ResponseEntityExceptionHandler {
	@ExceptionHandler(InvalidDataException.class)
	public ResponseEntity<ErrorDetailDTO> handleInvalidDataException(InvalidDataException ex) {
		ErrorDetailDTO error = new ErrorDetailDTO();
		error.setError(ex.getMessage());
		List<String> details = new ArrayList<>();
		details.add("Tên tòa nhà đang thiếu");
		error.setDetail(details);
		return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
	}
}
