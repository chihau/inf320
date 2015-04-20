package cl.chihau.hellointentfilters;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class NavegadorActivity extends Activity {
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.navegador);

        Uri url = getIntent().getData();
        WebView webView = (WebView) findViewById(R.id.webview_navegador);
        webView.setWebViewClient(new MyWebViewClient());
        webView.loadUrl(url.toString());
    }

    private class MyWebViewClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
        	// Al retornar false se carga la url en el webview en vez de 
        	// abrir el navegador para cargar la url (comportamiento por defecto
        	// en Android)
        	// Para mayor informaci—n: 
        	// http://developer.android.com/guide/webapps/webview.html#HandlingNavigation
            return false;
        }
    }

}
