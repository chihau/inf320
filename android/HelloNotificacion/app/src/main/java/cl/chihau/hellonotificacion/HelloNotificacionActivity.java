package cl.chihau.hellonotificacion;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.support.v4.app.NotificationCompat;
import android.support.v4.app.NotificationManagerCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class HelloNotificacionActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
    }

    public void notificar(View view) {

        NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(this)
                .setSmallIcon(android.R.drawable.stat_sys_warning)
                .setContentTitle("Título de la notificación")
                .setContentText("Texto de la notificación")
                .setTicker("Alerta!")
                .setDefaults(Notification.DEFAULT_ALL)
                .setAutoCancel(true);

        Intent intent1 = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:777777777"));
        PendingIntent llamar = PendingIntent.getActivity(this, 0, intent1, PendingIntent.FLAG_UPDATE_CURRENT);
        mBuilder.addAction(android.R.drawable.stat_notify_missed_call, "llamar", llamar);

        Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.amazon.com"));
        PendingIntent verURL = PendingIntent.getActivity(this, 0, intent2, PendingIntent.FLAG_UPDATE_CURRENT);
        mBuilder.addAction(android.R.drawable.stat_notify_more, "ver URL", verURL);

        NotificationManagerCompat notificationManagerCompat = NotificationManagerCompat.from(this);

        int mNotificationId = 001;

        notificationManagerCompat.notify(mNotificationId, mBuilder.build());
    }

    public void dialogo(View view) {
        AlertDialog.Builder mBuilder = new AlertDialog.Builder(this)
                .setTitle("Título del dialogo")
                .setMessage("Texto del dialogo");

        mBuilder.setPositiveButton("Aceptar", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int id) {
                Toast.makeText(HelloNotificacionActivity.this, Integer.toString(id), Toast.LENGTH_SHORT).show();
            }
        });

        mBuilder.setNeutralButton("Neutral", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int id) {
                Toast.makeText(HelloNotificacionActivity.this, Integer.toString(id), Toast.LENGTH_SHORT).show();
            }
        });

        mBuilder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int id) {
                Toast.makeText(HelloNotificacionActivity.this, Integer.toString(id), Toast.LENGTH_SHORT).show();
            }
        });


        AlertDialog dialog = mBuilder.create();
        dialog.show();
    }
}
