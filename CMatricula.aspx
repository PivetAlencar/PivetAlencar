<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="CMatricula.aspx.cs" Inherits="prjAdoNet.CMatricula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="featured">
        <div class="containerCentral">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="card efeito_Panel_2">
                    <div class="card-header">
                        Matricula de Alunos
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div>
                                <label for="nome">Nome do Aluno</label>
                                <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="nome">CPF</label>
                                    <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label for="nome">Data de Nascimento</label>
                                    <asp:TextBox ID="txtDT_Nascimento" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label for="nome">Telefone</label>
                                    <asp:TextBox ID="txtTlefone" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label for="nome">e-mail</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="nome">Nome da Mãe</label>
                                    <asp:TextBox ID="txtNomeMae" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label for="nome">Nome do Pai</label>
                                    <asp:TextBox ID="txtNomePai" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                        </div>

                    </div>
                    <div class="card-header">
                        Alunos Matriculados
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:GridView ID="gvAlunos" runat="server"
                                CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="ID_MATRICULA" OnRowCommand="gvMatricula_RowCommand">
                                <RowStyle CssClass="rowGrid" Wrap="False" />
                                <Columns>
                                    <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="100px" HeaderText="CPF">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblMatricula" runat="server" CommandArgument='<%#Eval("ID_MATRICULA").ToString() + "|" + Container.DataItemIndex.ToString()%>'
                                                Text='<%# (Eval("MATRICULA").ToString())  %>'>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ControlStyle Width="100px"></ControlStyle>
                                        <HeaderStyle Width="100px"></HeaderStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="NOME" HeaderText="NOME" />
                                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" />
                                </Columns>
                                <SelectedRowStyle BackColor="Yellow" />
                            </asp:GridView>
                        </div>

                    </div>
                    <div class="card-footer">
                        <div class="form-group">
                            <div class="form-group row">
                                <div class="col-md-3">
                                    <asp:Button ID="cmdConfirmar" runat="server" CssClass="btn btn-success" Text="Incluir" Font-Bold="true" Width="100%" OnClick="cmdConfirmar_Click" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Button ID="cmdExluir" runat="server" CssClass="btn btn-success" Text="Excluir" Font-Bold="true" Width="100%" Enabled="False" OnClick="cmdExluir_Click" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Button ID="cmdLimpar" runat="server" CssClass="btn btn-success" Text="Limpar" Font-Bold="true" Width="100%" OnClick="cmdLimpar_Click" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Button ID="cmdSair" runat="server" CssClass="btn btn-success" Text="Sair" Font-Bold="true" Width="100%" />
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
                </ContentTemplate>
                
            </asp:UpdatePanel>


        </div>

        <script>
            function aplicarDataTable() {
                var dt = $('#MainContent_gvAlunos').DataTable({
                    "language": {
                        "lengthMenu": 'Mostrar <select>' +
                            '<option value="5">05</option>' +
                            '<option value="10">10</option>' +
                            '<option value="20">30</option>' +
                            '</select> Operações',
                        "emptyTable": "Nenhum registro encontrado",
                        "search": "Pesquisar Operações:",
                        "info": "Mostrando página _PAGE_ de _PAGES_",
                        "infoFiltered": "(filtrado _MAX_ do total Alunos)",
                        "paginate": {
                            "first": "Primeiro",
                            "last": "Último",
                            "next": "Próximo",
                            "previous": "Anterior"
                        }

                    },
                    "pageLength": 5,
                    "scrollY": "300px",
                    "scrollCollapse": true,
                    "destroy": true


                });


                return dt;
            }
            aplicarDataTable();
        </script>
    </section>
</asp:Content>
