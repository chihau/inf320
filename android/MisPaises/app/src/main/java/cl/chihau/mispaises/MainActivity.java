package cl.chihau.mispaises;

import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener {
    List<String> countries = new ArrayList();
    ArrayAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        loadData();

        adapter = new ArrayAdapter(this, R.layout.list_item, countries);

        ListView lv = findViewById(R.id.mylistview);
        lv.setAdapter(adapter);
        lv.setOnItemClickListener(this);
    }

    public void agregar(View view) {
        EditText et = findViewById(R.id.myedittext);
        String country = et.getText().toString();

        if (country.length() > 0) {
            country = country.substring(0, 1).toUpperCase() +
                    country.substring(1, country.length()).toLowerCase();

            if (countries.contains(country)) {
                Toast.makeText(this, "Este país ya existe en la lista", Toast.LENGTH_SHORT).show();
            } else {
                countries.add(country);
                Collections.sort(countries);
                adapter.notifyDataSetChanged();
                et.setText("");
                saveData();
            }
        } else {
            Toast.makeText(this, "El campo está vacío", Toast.LENGTH_LONG).show();
        }
    }

    private void saveData() {
        SharedPreferences.Editor spe = getPreferences(MODE_PRIVATE).edit();

        HashSet<String> countriesHashSet = new HashSet(countries);

        // HashSet no permite elementos duplicados, y sólo un elemento con valor null
        spe.putStringSet("countries", countriesHashSet);
        spe.commit();
    }

    private void loadData() {
        SharedPreferences sp = getPreferences(MODE_PRIVATE);

        Set defValues = new HashSet();
        defValues.add("Argentina");
        defValues.add("Brasil");
        defValues.add("Bolivia");
        defValues.add("Chile");
        defValues.add("Perú");

        Set<String> countryList = sp.getStringSet("countries", defValues);
        for (String country : countryList) {
            countries.add(country);
        }
        Collections.sort(countries);
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int pos, long l) {
        Uri uri = Uri.parse("http://es.wikipedia.org/wiki/" + Uri.encode(countries.get(pos)));

        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        startActivity(intent);
    }
}