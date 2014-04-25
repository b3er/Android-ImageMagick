package org.magick;

/**
 * Exception class for all encompassing Exception.
 *
 * @author Eric Yeo
 * @see MagickApiException
 */
public class MagickException extends Exception {

	/**
	 * Construct an exception with a message.
	 *
	 * @param mesg message attached to the exception
	 */
	public MagickException(String mesg) {
		super(mesg);
	}

}
