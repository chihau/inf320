package cl.chihau.hellofragments;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class Fragment2 extends Fragment {
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, 
			Bundle savedInstanceState) {
		// Aumentamos el diseño para este fragment
		
		return inflater.inflate(R.layout.fragment2, container, false);
		
	}
	

}
