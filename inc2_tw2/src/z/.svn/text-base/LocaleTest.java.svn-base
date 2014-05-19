package z;

import java.util.Locale;

class LocaleTest {
	public static void main(String[] a) {
		// get the default locale
		Locale l = Locale.getDefault();
		System.out.println("   Language, Country, Variant, Name");
		System.out.println("");
		System.out.println("Default locale: ");
		System.out.println("   " + l.getLanguage() + ", " + l.getCountry() + ", " + ", " + l.getVariant() + ", "
				+ l.getDisplayName());
		// get a predefined locale
		l = Locale.CANADA_FRENCH;
		System.out.println("A predefined locale - Locale.CANADA_FRENCH:");
		System.out.println("   " + l.getLanguage() + ", " + l.getCountry() + ", " + ", " + l.getVariant() + ", "
				+ l.getDisplayName());
		// define a new locale
		l = new Locale("en", "CN");
		System.out.println("User defined locale -Locale(\"en\",\"CN\"):");
		System.out.println("   " + l.getLanguage() + ", " + l.getCountry() + ", " + ", " + l.getVariant() + ", "
				+ l.getDisplayName());
		// define another new locale
		l = new Locale("ll", "CC");
		System.out.println("User defined locale -Locale(\"ll\",\"CC\"):");
		System.out.println("   " + l.getLanguage() + ", " + l.getCountry() + ", " + ", " + l.getVariant() + ", "
				+ l.getDisplayName());
		// get the supported locales
		Locale[] s = Locale.getAvailableLocales();
		System.out.println("Supported locales: ");
		for (int i = 0; i < s.length; i++) {
			System.out.println("   " + s[i].getLanguage() + ", " + s[i].getCountry() + ", " + s[i].getVariant() + ", "
					+ s[i].getDisplayName());
		}
	}
}