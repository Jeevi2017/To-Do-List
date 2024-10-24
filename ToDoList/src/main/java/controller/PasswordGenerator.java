package controller;

import java.security.SecureRandom;

public class PasswordGenerator {
	private static final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";
    private static final String SPECIAL_CHAR = "!@#$%&*";
    private static final String DATA_FOR_RANDOM_STRING = CHAR_LOWER + CHAR_UPPER + NUMBER + SPECIAL_CHAR;
    private static SecureRandom random = new SecureRandom();

    public static String generatePassword() {
        int passwordLength = 8;

        StringBuilder sb = new StringBuilder(passwordLength);
        for (int i = 0; i < passwordLength; i++) {
            int randomCharIndex = random.nextInt(DATA_FOR_RANDOM_STRING.length());
            char randomChar = DATA_FOR_RANDOM_STRING.charAt(randomCharIndex);
            sb.append(randomChar);
        }
        return sb.toString();
    }
	
	
}
