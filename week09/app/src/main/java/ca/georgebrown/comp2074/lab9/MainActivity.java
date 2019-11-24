package ca.georgebrown.comp2074.lab9;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

  //make it accessible everywhere
  private WordsDbHelper dbHelper = null;


  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    WordsDbHelper dbHelper = new WordsDbHelper(this);
    SQLiteDatabase db = dbHelper.getWritableDatabase(); // we are going to write to the db

    Button btSave = findViewById(R.id.btnSave);
    final EditText word1 = findViewById(R.id.word1);
    final EditText word2 = findViewById(R.id.word1);

    btSave.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        String w1 = word1.getText().toString();
        String w2 = word2.getText().toString();
        long id = AddWord(w1,w2);
        Toast.makeText(v.getContext(),"Entry added with id="+id,
          Toast.LENGTH_LONG).show();
        word1.setText("");
        word2.setText("");

        //storing everything in a list
        Cursor c = getAllWords();
        List list = new ArrayList<String>();
        while (c.moveToNext()){
          String w = getString(c.getColumnIndex(
            WordContract.WordEntity.COLUMN_NAME_WORD1)
          );
          list.add(w);
        }
        Log.d("DB-RESULTS", "List has: "+ list.size()+" elements");
      }
    });
  }

  private long AddWord(String word1, String word2){
    SQLiteDatabase db = dbHelper.getWritableDatabase();
    ContentValues cv = new ContentValues();
    cv.put(WordContract.WordEntity.COLUMN_NAME_WORD1, word1);
    cv.put(WordContract.WordEntity.COLUMN_NAME_WORD2, word2);
    return db.insert(
      WordContract.WordEntity.TABLE_NAME,
      null, cv);
  }

  private Cursor getAllWords() {
    SQLiteDatabase db = dbHelper.getReadableDatabase();
    String[] projection = {
      WordContract.WordEntity._ID,
      WordContract.WordEntity.COLUMN_NAME_WORD1,
      WordContract.WordEntity.COLUMN_NAME_WORD2

    };
    String selection = null; //WordContract.WordEntity.COLUMN_NAME_WORD1+"= ?"
    String[] selectionArgs = null; //{"test"}

    return db.query(
      WordContract.WordEntity.TABLE_NAME,  // table to query
      projection,  //columns we select
      selection, //columns for WHERE clause
      selectionArgs, // parameters for WHERE clause
      null, //columns for GROUP BY
      null, //columns for HAVING
      null //sorting order ASC odf DESC
    );
  }

}
