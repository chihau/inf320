package cl.chihau.hellonotificacion;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.NotificationCompat;
import android.view.View;
import android.widget.Toast;

public class HelloNotificacionActivity extends Activity {
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		
	}
	
	public void notificar(View view) {
		
		NotificationCompat.Builder mBuilder =
		        new NotificationCompat.Builder(HelloNotificacionActivity.this)
		        .setSmallIcon(android.R.drawable.stat_sys_warning)
		        .setContentTitle("Título de la notificación")
		        .setContentText("Texto de la notificación")
		        .setTicker("Alerta!")
		        .setDefaults(Notification.DEFAULT_ALL)
		        .setAutoCancel(true); // Para eliminar la notificacion una vez
									  // que se haya seleccionado

		Intent intent0 = new Intent(this, SecondActivity.class);
		PendingIntent contIntent = PendingIntent.getActivity(
				this, 0, intent0, PendingIntent.FLAG_UPDATE_CURRENT);
		mBuilder.setContentIntent(contIntent);

		Intent intent1 = new Intent(android.content.Intent.ACTION_VIEW, Uri.parse("geo:40.8277,-100.8277"));
		PendingIntent llamar = PendingIntent.getActivity(this, 0, intent1, 0);
		mBuilder.addAction(android.R.drawable.stat_notify_missed_call, "llamar", llamar);

		Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.google.com"));
		PendingIntent verUrl = PendingIntent.getActivity(this, 0, intent2, 0);
        mBuilder.addAction(android.R.drawable.stat_notify_more, "ver URL", verUrl);

		NotificationManager mNotificationManager =
		    (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

		int mNotificationId = 001;
		mNotificationManager.notify(mNotificationId, mBuilder.build());
	}
	
	public void dialogo(View view) {
		AlertDialog.Builder builder = new AlertDialog.Builder(this);

		builder.setMessage("Texto del diálogo")
		       .setTitle("Título del diálogo");
		
		builder.setPositiveButton("Aceptar", new DialogInterface.OnClickListener() {
	           public void onClick(DialogInterface dialog, int id) {
	               Toast.makeText(getApplicationContext(), Integer.toString(id), Toast.LENGTH_SHORT).show();
	           }
	    });
		builder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
	           public void onClick(DialogInterface dialog, int id) {
	               Toast.makeText(getApplicationContext(), Integer.toString(id), Toast.LENGTH_SHORT).show();
	           }
	    });
        builder.setNeutralButton("Neutral", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                Toast.makeText(getApplicationContext(), Integer.toString(id), Toast.LENGTH_SHORT).show();
            }
        });

		AlertDialog dialog = builder.create();
		dialog.show();
	}
}
