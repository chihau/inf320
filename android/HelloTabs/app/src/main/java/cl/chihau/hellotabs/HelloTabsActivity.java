package cl.chihau.hellotabs;

import android.app.Activity;
import android.content.res.Resources;
import android.os.Bundle;
import android.widget.TabHost;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.Toast;

public class HelloTabsActivity extends Activity {
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		Resources res = getResources();
		
		TabHost tabs=(TabHost)findViewById(android.R.id.tabhost);
        tabs.setup();
        
        TabHost.TabSpec spec=tabs.newTabSpec("mitab1");
        spec.setContent(R.id.tab1);
        spec.setIndicator("", res.getDrawable(R.drawable.icon_search));
        tabs.addTab(spec);
        
        spec=tabs.newTabSpec("mitab2");
        spec.setContent(R.id.tab2);
        spec.setIndicator("", res.getDrawable(R.drawable.icon_settings));
        tabs.addTab(spec);
        
        spec=tabs.newTabSpec("mitab3");
        spec.setContent(R.id.tab3);
        spec.setIndicator("", res.getDrawable(R.drawable.icon_help));
        
        /*spec = tabHost.newTabSpec("overview")
                .setIndicator(Build.VERSION.SDK_INT < 11 ? this.getString(R.string.descr) : "", res.getDrawable(R.drawable.tab_overview))
                .setContent(intent);*/
        
        tabs.addTab(spec);
        
        tabs.setCurrentTab(0);
        
        tabs.setOnTabChangedListener(new OnTabChangeListener() {
            @Override
            public void onTabChanged(String tabId) {
            	Toast.makeText(getApplicationContext(), 
            			"Pulsada pestaña: " + tabId, Toast.LENGTH_SHORT).show();
            }
        });
        
	}

}
