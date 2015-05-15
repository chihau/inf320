package cl.chihau.hellointentfilters;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends Activity {
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
	}
	
	public void navegar(View view) {
        Intent i = new Intent("cl.chihau.accion.navegar", 
        		Uri.parse("http://www.google.com"));
        //startActivity(Intent.createChooser(i, "Open browser app"));
        startActivity(i);
	}

}
