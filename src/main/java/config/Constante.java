package config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Constante {
	private Constante() {
		throw new IllegalStateException("Utility class");
	}

	public static List<String> getPaths() {
		return PATHS;
	}

	private static final List<String> PATHS = new ArrayList<>(
			Arrays.asList("create", "edit", "index", "delete", "liste"));
	public static final String BASEPATH = "content";
	private static final Pattern NAME_PATTERN = Pattern.compile("^[A-Za-z]+(?:[-'.\\s][A-Za-z]+)*[A-Za-z]$");
	private static final Pattern EMAIL_PATTERN = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
	private static final Pattern PHONE_PATTERN = Pattern.compile("^(\\+?221 ?7[5-8]|7[5-8]) ?\\d{3} ?\\d{2} ?\\d{2}$");
	private static final Pattern DATE_PATTERN = Pattern.compile("^\\d{4}-\\d{2}-\\d{2}$");
	private static final Pattern YEAR_PATTERN = Pattern.compile("^\\d{4}\\/\\d{4}$");
	private static final Pattern NUM_PATTERN = Pattern.compile("^[0-9]+$");

	public static boolean isValidEmail(String email) {
		Matcher matcher = EMAIL_PATTERN.matcher(email);
		return matcher.matches();
	}
	public static boolean isNumber(String number) {
		Matcher matcher = NUM_PATTERN.matcher(number);
		return matcher.matches();
	}

	public static boolean isValidYear(String year) {
		Matcher matcher = YEAR_PATTERN.matcher(year);
		return matcher.matches();
	}

	public static boolean isValidPhoneNumber(String phoneNumber) {
		Matcher matcher = PHONE_PATTERN.matcher(phoneNumber);
		return matcher.matches();
	}

	public static boolean isValidName(String name) {
		Matcher matcher = NAME_PATTERN.matcher(name);
		return matcher.matches();
	}

	public static boolean isValidDate(String date) {
		Matcher matcher = DATE_PATTERN.matcher(date);
		return matcher.matches();
	}
}
