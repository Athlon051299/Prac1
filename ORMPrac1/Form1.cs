using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ORMPrac1
{
    public partial class Form1 : Form

    {
        //Desarrollo del list, donde se agregan las variables

        public List<Model.ALUMNO> oAlumno;
        public List<Model.APODERADO> oApoderado;
        public List<Model.CURSO> oCurso;
        public List<Model.INSCRITO> oInscrito;
        int indice = 0; 

        public Form1()
        {
            InitializeComponent();
        }

        //Este es el metodo para el llenado del texbox 
        public void Llenar ()
        { 
            //Limite
            if (indice < 0)
                indice = 0;

            //Variable Cadena
            string cadena = "";

            // Se crea el switch 

            switch (comboBox1.SelectedIndex)
            {
                case 0:
                    if (indice >= oAlumno.Count)
                        indice = oAlumno.Count - 1;

                    cadena = oAlumno[indice].Id.ToString() + ". " + oAlumno[indice].Nombre + ", de " + oAlumno[indice].Ciudad + ", " + oAlumno[indice].Edad + " años" ;
                    break;

                case 1:
                    if (indice >= oApoderado.Count)
                        indice = oApoderado.Count - 1;
                    using (Model.BDprac1Entities db = new Model.BDprac1Entities())
                    {
                        oAlumno = db.ALUMNO.ToList();
                        cadena = oApoderado[indice].Id.ToString() + ", " + oApoderado[indice].Nombre + ", es el|la apoderado|a de" + oAlumno.Find(a => a.Id == (int)oApoderado[indice].Id_Alumno).Nombre;

                    }
                    break;
                case 2:
                    if (indice >= oCurso.Count)
                        indice = oCurso.Count - 1;

                    cadena = oCurso[indice].Cod.ToString() + ", Codigo del curso | " + ",| Nombre del curso  " + oCurso[indice].Nombre  + oCurso[indice].Fecha_Inicio + ",| Fecha de inicio " + oCurso[indice].Duracion + ",| Duracion" + oCurso[indice].Valor + ",| Valor";

                    break;

                case 3:
                    if (indice >= oInscrito.Count)
                        indice = oInscrito.Count - 1;
                    using (Model.BDprac1Entities db = new Model.BDprac1Entities())
                    {
                        oAlumno = db.ALUMNO.ToList();
                        oCurso = db.CURSO.ToList();
                        cadena = oInscrito[indice].Id.ToString() + ",| Id del Alumno| " + oAlumno.Find(a => a.Id == (int)oInscrito[indice].Id_Alumno).Id +  ", |Id del curso| " + oCurso.Find(b => b.Cod == (int)oInscrito[indice].Cod_Curso).Cod;
                    }

                    break;
            }
            //Enviamos la informacion al textbox 
            textBox1.Text = cadena;


        
        }

        private void Form1_Load(object sender, EventArgs e)
        {
         //Aqui se añaden los items para  el Combobox
            comboBox1.Items.Add("ALUMNO");
            comboBox1.Items.Add("APODERADO");
            comboBox1.Items.Add("CURSO");
            comboBox1.Items.Add("INSCRITO");
            

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
           //Se conecta los datos con el Combobox 
            using (Model.BDprac1Entities db = new Model.BDprac1Entities() )
            { 
                switch (comboBox1.SelectedIndex)
                {
                    case 0:
                        oAlumno = db.ALUMNO.ToList();
                        break;
                    case 1:
                        oApoderado = db.APODERADO.ToList();
                        break;
                    case 2:
                        oCurso = db.CURSO.ToList();
                        break;
                    case 3:
                        oInscrito = db.INSCRITO.ToList();
                        break;
                    
                }

            }
            indice = 0;
            Llenar();

        }

        private void button1_Click(object sender, EventArgs e)
        {

            indice--;
            //Metodo llenar
            Llenar();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            indice++;
            //Metodo llenar
            Llenar();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }

}
