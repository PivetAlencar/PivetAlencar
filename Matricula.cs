using prjAdoNet.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace prjAdoNet.BLL
{
    public class Matricula
    {
        private static string connString = Funcoes.connString;
        private Int32 id_matricula;
        private Int32 id_turma;
        private Int32 id_aluno;
        private DateTime data_matricula;

        public static string ConnString { get => connString; set => connString = value; }
        public int Id_matricula { get => id_matricula; set => id_matricula = value; }
        public int Id_turma { get => id_turma; set => id_turma = value; }
        public int Id_aluno { get => id_aluno; set => id_aluno = value; }
        public DateTime Data_matricula { get => data_matricula; set => data_matricula = value; }

        public void Inserir()
        {
            string meuSQL = "INSERT INTO TB_MATRICULA( ID_TURMA, ID_ALUNO, DATA_MATRICULA" +
                "(" + id_turma + "," + id_aluno + ",CONVERT(DATETIME,'" + Funcoes.DateToDB(data_matricula) + "',111)";
            SqlHelper.ExecuteNonQuery(ConnString, CommandType.Text, meuSQL);
        }

        public void Alterar()
        {
            string meuSQL = "UPDATE TB_MATRICULA SET " +
                            "ID_TURMA='" + id_turma + "'," +
                            "ID_ALUNO= '" + id_aluno + "'," +
                            "DATA_MATRICULA= CONVERT(DATETIME, '" + Funcoes.DateToDB(data_matricula) + "'111)";
                            "WHERE ID_MATRICULA =" + id_matricula;
            SqlHelper.ExecuteNonQuery(connString, CommandType.Text, meuSQL);

        }

        public void Excluir(int CODIGO)
        {
            string meuSQL = "DELETE TB_MATRICULA WHERE ID_MATRICULA= " + CODIGO;
            SqlHelper.ExecuteNonQuery(connString, CommandType.Text, meuSQL);

        }
        
        public void MostrarDados_Matricula(Int32 CODIGO)
        {
            string meuSQL = @"SELECT tb_aluno.nome, tb_matricula.id_matricula,
                                     tb_matricula.id_turma, tb_matricula.id_aluno, 
                                     tb_matricula.data_matricula, tb_turma.data_inicio, tb_turma.data_fim
                              FROM tb_aluno INNER JOIN
                                    tb_matricula ON tb_aluno.id_aluno =tb_matricula.id_aluno INNER JOIN
                                    tb_turma ON tb_matricula.id_turma =tb_turma.id_turma
                                     WHERE ID_MATRICULA ="+ CODIGO;
            DataSet ds = SqlHelper.ExecuteDataset(ConnString, CommandType.Text, meuSQL);
            if ((ds.Tables[0].Rows.Count > 0))
            {
                DataRow dr = ds.Tables[0].Rows[0];
                id_matricula = Convert.ToInt32(dr["ID_MATRICULA"]);
                id_turma = Convert.ToInt32(dr["ID_TURMA"]);
                id_aluno = Convert.ToInt32(dr["ID_ALUNO"]);
                data_matricula = Convert.ToDateTime(dr["DT_MATRICULA"]);
            }

        }
    }
}