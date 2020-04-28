package cl.chihau.holalistview;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    String[] COUNTRIES = {"Argentina", "Bolivia", "Chile", "China", "Colombia", "España", "Estados Unidos",
            "Francia", "Italia", "Panamá", "Perú", "Puerto Rico", "Rusia", "Uruguay", "Venezuela"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ArrayAdapter adaptador = new ArrayAdapter(MainActivity.this, R.layout.list_item, COUNTRIES);

        ListView lv = findViewById(R.id.lv);

        lv.setAdapter(adaptador);
    }
}
