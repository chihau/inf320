package cl.chihau.hellofragmentslifecycle;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class Fragment1 extends Fragment {
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, 
			Bundle savedInstanceState) {
        Log.d("Fragment 1", "onCreateView");
		return inflater.inflate(R.layout.fragment1, container, false);
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		Log.d("Fragment 1", "onAttach");
	}
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Log.d("Fragment 1", "onCreate");
	}
	
	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		Log.d("Fragment 1", "onActivityCreated");
	}
	
	@Override
	public void onStart() {
		super.onStart();
		Log.d("Fragment 1", "onStart");
	}
	
	@Override
	public void onResume() {
		super.onResume();
		Log.d("Fragment 1", "onResume");
	}
	
	@Override
	public void onPause() {
		super.onPause();
		Log.d("Fragment 1", "onPause");
	}
	
	@Override
	public void onStop() {
		super.onStop();
		Log.d("Fragment 1", "onStop");
	}
	
	@Override
	public void onDestroyView() {
		super.onDestroyView();
		Log.d("Fragment 1", "onDestroyView");
	}
	
	@Override
	public void onDestroy() {
		super.onDestroy();
		Log.d("Fragment 1", "onDestroy");
	}
	
	@Override
	public void onDetach() {
		super.onDetach();
		Log.d("Fragment 1", "onDetach");
	}
}
