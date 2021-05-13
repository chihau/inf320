package cl.chihau.holalifecycle;

import android.os.Bundle;
import android.util.Log;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    private static String LOGTAG = "HolaLifeCycle";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.d(LOGTAG, "onCreate");
    }

    @Override
    protected void onStart() {
        super.onStart();
        Log.d(LOGTAG, "onStart");
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d(LOGTAG, "onResume");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d(LOGTAG, "onPause");
    }

    @Override
    protected void onStop() {
        super.onStop();
        Log.d(LOGTAG, "onStop");
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        Log.d(LOGTAG, "onRestart");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d(LOGTAG, "onDestroy");
    }
}
