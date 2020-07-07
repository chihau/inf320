package cl.chihau.holafragments;

import android.content.res.Configuration;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

public class Fragment1 extends Fragment {

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment1, container, false);
    }

    @Override
    public void onStart() {
        super.onStart();

        int orientation = getResources().getConfiguration().orientation;

        if (orientation == Configuration.ORIENTATION_LANDSCAPE) {
            Button cambiarTextoFragment2 = getActivity().findViewById(R.id.cambiar_texto_fragment2);
            cambiarTextoFragment2.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    TextView tvFragment2 = getActivity().findViewById(R.id.tv_fragment2);
                    tvFragment2.setText("Hola! desde Fragment #1 a Fragment #2");
                }
            });
        } else {
            Button pasarFragment2 = getActivity().findViewById(R.id.pasar_fragment2);
            pasarFragment2.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    FragmentManager fragmentManager = getFragmentManager();
                    FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();

                    Fragment2 fragment2 = new Fragment2();
                    // android.R.id.content es el id que tiene por defecto el ViewGroup de toda el
                    // área de contenido
                    fragmentTransaction.replace(android.R.id.content, fragment2);

                    // Permite volver al fragment1 presionando el botón BACK
                    fragmentTransaction.addToBackStack(null);

                    fragmentTransaction.commit();
                }
            });
        }

    }
}
