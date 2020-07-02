package cl.chihau.holatabs;

import android.os.Bundle;

import com.google.android.material.tabs.TabLayout;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.viewpager.widget.ViewPager;

public class MainActivity extends AppCompatActivity {

    private ViewPager viewPager;
    private TabLayout tabLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        PagerAdapter adapter = new PagerAdapter(getSupportFragmentManager());
        viewPager = findViewById(R.id.pager);
        viewPager.setAdapter(adapter);

        tabLayout = findViewById(R.id.tabLayout);
        tabLayout.setupWithViewPager(viewPager);

        // Recordar eliminar los archivo XML de tipo Drawable anydpi
        // ic_tab_search.xml, ic_tab_settings.xml y ic_tab_help.xml
        tabLayout.getTabAt(0).setIcon(R.drawable.ic_tab_search);
        tabLayout.getTabAt(1).setIcon(R.drawable.ic_tab_settings);
        tabLayout.getTabAt(2).setIcon(R.drawable.ic_tab_help);

    }
}
