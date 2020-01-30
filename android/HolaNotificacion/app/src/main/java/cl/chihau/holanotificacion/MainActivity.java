package cl.chihau.holanotificacion;

import android.app.AlertDialog;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void notificar(View view) {
        NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(this,
                "my_channel_01")
                .setSmallIcon(android.R.drawable.stat_sys_warning)
                .setContentTitle("Título de la notificación")
                .setContentText("Texto de la notificación")
                .setTicker("Alerta!")
                .setDefaults(NotificationCompat.DEFAULT_ALL)
                .setAutoCancel(true)
                .setColorized(true)
                .setColor(getResources().getColor(R.color.colorAccent));

        Intent intent0 = new Intent(this, SecondActivity.class);
        PendingIntent contIntent = PendingIntent.getActivity(this, 0, intent0,
                PendingIntent.FLAG_UPDATE_CURRENT);
        mBuilder.setContentIntent(contIntent);

        Intent intent1 = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:+111111111"));
        PendingIntent llamar = PendingIntent.getActivity(this, 0, intent1, 0);
        mBuilder.addAction(android.R.drawable.stat_notify_missed_call, "llamar", llamar);

        Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.google.com"));
        PendingIntent verURL = PendingIntent.getActivity(this, 0, intent2, 0);
        mBuilder.addAction(android.R.drawable.stat_notify_more, "ver URL", verURL);

        NotificationManagerCompat mNotificationManager = NotificationManagerCompat.from(this);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            String name = "My Channel";
            String description = "Channel Description";
            int importance = NotificationManager.IMPORTANCE_DEFAULT;

            NotificationChannel channel = new NotificationChannel("my_channel_01", name, importance);
            channel.setDescription(description);

            NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
            manager.createNotificationChannel(channel);
        }

        mNotificationManager.notify(1, mBuilder.build());

    }

    public void dialogo(View view) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);

        builder.setTitle("Título del diálogo")
                .setMessage("Texto del diálogo");

        builder.setPositiveButton("Aceptar", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int id) {
                Toast.makeText(getApplicationContext(), Integer.toString(id), Toast.LENGTH_LONG).show();
            }
        });

        builder.setNeutralButton("Neutral", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int id) {
                Toast.makeText(getApplicationContext(), Integer.toString(id), Toast.LENGTH_LONG).show();
            }
        });

        builder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int id) {
                Toast.makeText(getApplicationContext(), Integer.toString(id), Toast.LENGTH_LONG).show();
            }
        });

        AlertDialog dialog = builder.create();
        dialog.show();

    }
}
