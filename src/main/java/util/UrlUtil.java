package util;

import java.net.URI;
import java.net.URISyntaxException;


public class UrlUtil {

    private UrlUtil() {
    }


    /**
     * 外部リンクとして安全なURLか確認する。
     *
     * 許可:
     * http://
     * https://
     *
     * 不許可:
     * javascript:
     * data:
     * file:
     * ftp:
     * URLとして不正な文字列
     */
    public static String safeHttpUrl(String value) {

        if (value == null
                || value.isBlank()) {

            return null;
        }


        String trimmed =
                value.trim();


        try {

            URI uri =
                    new URI(trimmed);


            String scheme =
                    uri.getScheme();


            if (scheme == null) {

                return null;
            }


            boolean safeScheme =
                    "http".equalsIgnoreCase(scheme)
                    ||
                    "https".equalsIgnoreCase(scheme);


            if (!safeScheme) {

                return null;
            }


            /*
             * http / https でも
             * ホスト名が無ければ不正URLとして扱う
             */

            if (uri.getHost() == null
                    || uri.getHost().isBlank()) {

                return null;
            }


            return uri.toASCIIString();


        } catch (URISyntaxException e) {

            return null;
        }
    }
}