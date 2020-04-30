package cl.chihau.mispaises;

import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity implements View.OnClickListener,
        AdapterView.OnItemClickListener {

    List countries = new ArrayList();
    ArrayAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setContentView(R.layout.activity_main);

        ListView lv = findViewById(R.id.mylistview);

        loadData();

        adapter = new ArrayAdapter(this, R.layout.list_item, countries);

        lv.setAdapter(adapter);

        Button btn = findViewById(R.id.mybutton);
        btn.setOnClickListener(this);

        lv.setOnItemClickListener(this);
    }

    @Override
    public void onClick(View view) {
        EditText et = findViewById(R.id.myedittext);

        String country = et.getText().toString();

        country = country.substring(0, 1).toUpperCase() +
                country.substring(1, country.length()).toLowerCase();

        if (country.length() > 0) {
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
            Toast.makeText(this, "El campo está vacío", Toast.LENGTH_SHORT).show();
        }

    }

    private void saveData() {
        SharedPreferences.Editor spe = getPreferences(MODE_PRIVATE).edit();

        // HashSet no permite elementos duplicados, y sólo un elemento con valor null
        spe.putStringSet("countries", new HashSet(countries));
        spe.commit();
    }

    private void loadData() {
        SharedPreferences sp = getPreferences(MODE_PRIVATE);

        Set<String> defValues = new HashSet();
        defValues.add("Argentina");
        defValues.add("Brasil");
        defValues.add("Bolivia");
        defValues.add("Chile");
        defValues.add("Perú");

        Set<String> countryList = sp.getStringSet("countries", defValues);
        Log.d("TEST", "Test " + countryList.toString());
        for (String country : countryList) {
            countries.add(country);

        }
        Collections.sort(countries);
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int pos, long id) {
        Uri uri = Uri.parse("http://en.wikipedia.org/wiki/" +
                Uri.encode(countries.get(pos).toString()));

        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        startActivity(intent);
    }

}
