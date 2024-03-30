package com.iyf.salesledger.common.exception;

import java.text.MessageFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomException extends Exception {

	private static final long serialVersionUID = 1L;
	
	private final CustomExceptionCode customExceptionCode;

	/***
	 * <pre>
	 * CustomException 기본 에러메시지를 가지는 예외
	 * </pre>
	 * @param customExceptionCode 예외코드
	 */
    public CustomException(CustomExceptionCode customExceptionCode) {
        super(formatMessage(customExceptionCode.getErrorMessage()));
        this.customExceptionCode = customExceptionCode;
    }
    /***
     * <pre>
     * CustomException 변수 바인딩한 에러메시지를 가지는 예외
     * </pre>
     * @param customExceptionCode 예외코드
     * @param args 바인딩할 변수
     */
    public CustomException(CustomExceptionCode customExceptionCode, String... args) {
    	super(formatMessage(customExceptionCode.getErrorMessage(), (Object[]) args));
    	this.customExceptionCode = customExceptionCode;
    }

    public CustomExceptionCode getCustomExceptionCode() {
        return this.customExceptionCode;
    }
    
    private static String formatMessage(String errorMessage, Object... args) {
        if (args == null || args.length == 0) {
            return removePlaceholders(errorMessage).trim();
        } else {
            return MessageFormat.format(errorMessage, (Object[]) args);
        }
    }
    
    private static String removePlaceholders(String message) {
        Pattern pattern = Pattern.compile("\\{\\d+\\}");
        Matcher matcher = pattern.matcher(message);
        return matcher.replaceAll("");
    }
}
