package cr.ac.ucr.android_phpexamen;

//import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity implements Response.Listener<JSONObject>,Response.ErrorListener {

    private EditText txtNombre;
    private EditText txtCorreo;
    private EditText txtAsunto;
    private EditText txtComentario;

    private JsonObjectRequest json;
    private RequestQueue request;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtNombre = findViewById(R.id.txt_nombre);
        txtCorreo = findViewById(R.id.txt_correo);
        txtAsunto = findViewById(R.id.txt_asunto);
        txtComentario = findViewById(R.id.txt_correo);

        request = Volley.newRequestQueue(this);

    }

    public void guardar (View view) throws JSONException {

        JSONObject jsonBody = new JSONObject();
        jsonBody.put("nombre",txtNombre.getText().toString());
        jsonBody.put("correo",txtCorreo.getText().toString());
        jsonBody.put("asunto", txtAsunto.getText().toString());
        jsonBody.put("comentario",txtComentario.getText().toString());

        Toast.makeText(this,"Guardando...",Toast.LENGTH_LONG).show();
        String url = "http://api-comentarios.xp3.biz/comments.php";
        try {
            final StringRequest stringReq = new StringRequest(Request.Method.POST, url, jsonBody, this, this);
            request.add(json);
            System.out.println("\n\n######################");
            System.out.println(request.getSequenceNumber() );
        }catch(Exception e){
            Toast.makeText(this,e.getMessage(),Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void onErrorResponse(VolleyError error) {
        System.out.println("\n\n######################");
        System.out.println(error.getMessage());
        Toast.makeText(this,"El registro no se guardo",Toast.LENGTH_LONG).show();
    }

    @Override
    public void onResponse(JSONObject response) {
        Toast.makeText(this,"El registro se guardo con exito",Toast.LENGTH_LONG).show();
        Toast.makeText(this,response.toString(),Toast.LENGTH_LONG).show();
    }
    }
