package cl.chihau.hellofragments;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

public class Fragment1 extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Aumentamos el diseño para este fragment
        return inflater.inflate(R.layout.fragment1, container, false);
    }

    @Override
    public void onStart() {
        super.onStart();

        // Chequeamos si tenemos un frame en el cual meter el fragment de
        // detalle
        // directamente al UI contenida
        View fragment2 = getActivity().findViewById(R.id.fragment2);
        // Si tenemos el frame de detalles y este es visible entonces significa
        // que tenemos panel dual (es decir carg� el layout para landscape)
        Boolean mDualPane = (fragment2 != null
                && fragment2.getVisibility() == View.VISIBLE);
        if (mDualPane) {
            Button btnGetText = (Button) getActivity().findViewById(
                    R.id.btnGetText);

            ViewGroup layout = (ViewGroup) btnGetText.getParent();
            if (null != layout)
                layout.removeView(btnGetText);

            Button btnGetText2 = (Button) getActivity().findViewById(
                    R.id.btnGetText2);

            btnGetText2.setOnClickListener(new OnClickListener() {

                @Override
                public void onClick(View view) {
                    TextView lbl = (TextView) getActivity().findViewById(
                            R.id.lblFragment2);
                    lbl.setText("Hola! desde Fragment #1 a Fragment #2");
                }

            });

        } else {
            Button btnGetText = (Button) getActivity().findViewById(
                    R.id.btnGetText);

            btnGetText.setOnClickListener(new OnClickListener() {

                @Override
                public void onClick(View view) {
                    FragmentManager fragmentManager = getFragmentManager();
                    FragmentTransaction fragmentTransaction = fragmentManager
                            .beginTransaction();

                    Fragment2 fragment2 = new Fragment2();
                    // android.R.id.content es el id que tiene por defecto el ViewGroup de toda el
                    // área de contenido
                    fragmentTransaction
                            .replace(android.R.id.content, fragment2);

                    fragmentTransaction.addToBackStack(null);
                    fragmentTransaction.commit();
                }

            });

            Button btnGetText2 = (Button) getActivity().findViewById(
                    R.id.btnGetText2);
            ViewGroup layout = (ViewGroup) btnGetText2.getParent();
            if (null != layout)
                layout.removeView(btnGetText2);
        }
    }
}
