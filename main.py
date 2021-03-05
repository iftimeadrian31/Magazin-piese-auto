import cx_Oracle
from tkinter import *
from tkinter import ttk
import tkinter as tk
from tkinter import messagebox
from datetime import date
class Modificare_Tranzactii(Frame):
    def __init__(self, top, conn,app):
        Frame.__init__(self, top)
        self.top = top
        self.top.geometry("400x200")
        self.conn = conn
        self.app=app

        index=self.app.listBox.focus()
        valoare=self.app.listBox.item(index)['values']
        id_tranzactie=valoare[0]
        label = Label(self.top, text="Update_Tranzactie "+str(id_tranzactie), font=("Arial", 20)).grid(row=0, columnspan=2, column=1)
        cur = self.conn.cursor()
        command = """
                        select denumire_piesa from piese where id_piesa='""" + str(valoare[1]) + """'"""
        cur.execute(command)
        row = cur.fetchall()
        nume = row[0][0]

        if(valoare[2]=="I"):
            label = Label(self.top, text="Aprovizionare "+ nume , font=("Arial", 15)).grid(row=1,column=2)
        else:
            label = Label(self.top, text="Vanzare "+ nume, font=("Arial", 15)).grid(row=1,column=2)
        label = Label(self.top, text="cantitate", font=("Arial", 15)).grid(row=2, column=1)
        self.search_box_cantitate = Entry(self.top, width=20)
        self.search_box_cantitate.insert(0,valoare[4])
        self.search_box_cantitate.grid(row=2, column=2)
        label = Label(self.top, text="Data", font=("Arial", 15)).grid(row=3, column=1)
        self.search_box_data = Entry(self.top, width=20)
        self.search_box_data.insert(0,valoare[3])
        self.search_box_data.grid(row=3, column=2)
        Update_BTN = Button(top, text="Update", width=15,command=lambda: self.button()).grid(row=4, column=2)


    def button(self):
        try:
            self.app.cantitate = int(self.search_box_cantitate.get())
        except:
            messagebox.showerror("Error", "Nu ai introdus noua cantitate")
            return
        try:
            self.app.data="'"
            self.app.data += self.search_box_data.get()
            self.app.data+="'"
        except:
            messagebox.showerror("Error", "Nu ai introdus noua data")
            return
        try:
            self.app.update_tranzactii()
        except:
            messagebox.showerror("Error", "Cantitate insuficienta in acel moment al timpului")
            return

class Detalii(Frame):
    def __init__(self, top, conn,app):
        Frame.__init__(self, top)
        self.top = top
        self.top.geometry("1400x500")
        self.conn = conn
        self.app=app
        self.type=""
        cur = self.conn.cursor()
        index = self.app.listBox.focus()
        valoare = self.app.listBox.item(index)['values']
        command="""
                select id_piesa from piese where denumire_piesa='"""+valoare[0]+"""'"""
        cur.execute(command)
        row=cur.fetchall()
        id=row[0][0]
        command="""
                select t2.denumire_piesa,t1.culoare_caroserie,t1.material_caroserie,t2.pret_piesa from piese_caroserie t1 , piese t2 where t1.id_piesa=t2.id_piesa and t1.id_piesa='"""+str(id)+"""'"""
        cur.execute(command)
        row=cur.fetchall()
        if(len(row)==1):
            self.type="piese_caroserie"
        else:
            command="""
                    select t2.denumire_piesa,t1.intrebuintare_bec,t1.tip_bec,t1.flux_luminos_bec,t1.durata_medie_viata,t1.consum_energie_bec,t2.pret_piesa from becuri t1 , piese t2 where t1.id_piesa=t2.id_piesa and t1.id_piesa='"""+str(id)+"""'"""
            cur.execute(command)
            row=cur.fetchall()
            if (len(row) == 1):
                self.type = "becuri"
            else:
                command="""
                        select t2.denumire_piesa,t1.producator_ulei,t1.clasa_vascozitate,t1.capacitate,t2.pret_piesa from ulei t1 , piese t2 where t1.id_piesa=t2.id_piesa and t1.id_piesa='"""+str(id)+"""'"""
                cur.execute(command)
                row=cur.fetchall()
                if (len(row) == 1):
                    self.type = "ulei"
                else:
                    command="""
                            select t2.denumire_piesa,t1.senzori_ploaie,t1.senzori_lumina,t1.camera,t1.grad_transparenta,t2.pret_piesa from parbrize t1 , piese t2 where t1.id_piesa=t2.id_piesa and t1.id_piesa='"""+str(id)+"""'"""
                    cur.execute(command)
                    row=cur.fetchall()
                    if (len(row) == 1):
                        self.type = "parbrize"

        label = Label(self.top, text="     Detalii", font=("Arial", 30)).grid(row=0, columnspan=1,column=0)
        if self.type=="piese_caroserie":
            cols = ( "Denumire",'Culoare', 'Material',"Pret")
            self.listBox = ttk.Treeview(self.top, columns=cols, show='headings')
            for col in cols:
                self.listBox.heading(col, text=col)
            self.listBox.grid(row=3, column=0, columnspan=1)
            self.listBox.insert("", "end", values=(row[0][0], row[0][1], row[0][2],row[0][3]))
        elif self.type=="becuri":
            cols = ("Denumire","Intrebuintare", 'Tip', 'Flux luminos', "Durata medie viata","Consum energie","Pret")
            self.listBox = ttk.Treeview(self.top, columns=cols, show='headings')
            for col in cols:
                self.listBox.heading(col, text=col)
            self.listBox.grid(row=3, column=0, columnspan=1)
            self.listBox.insert("", "end", values=(row[0][0], row[0][1], row[0][2],row[0][3],row[0][4],row[0][5],row[0][6]))
        elif self.type=="ulei":
            cols = ("Denumire","Producator", 'Clasa vascozitate', 'Capacitate', "Pret")
            self.listBox = ttk.Treeview(self.top, columns=cols, show='headings')
            for col in cols:
                self.listBox.heading(col, text=col)
            self.listBox.grid(row=3, column=0, columnspan=1)
            self.listBox.insert("", "end", values=(row[0][0], row[0][1], row[0][2],row[0][3],row[0][4]))
        elif self.type=="parbrize":
            cols = ("Denumire", 'Senzori ploaie', 'Senzori lumina','Camera',"Grad transparenta", "Pret")
            self.listBox = ttk.Treeview(self.top, columns=cols, show='headings')
            for col in cols:
                self.listBox.heading(col, text=col)
            self.listBox.grid(row=3, column=0, columnspan=1)
            self.listBox.insert("", "end", values=(row[0][0], row[0][1], row[0][2],row[0][3],row[0][4],row[0][5]))
class Tranzactii(Frame):
    def __init__(self, top, conn,app):
        Frame.__init__(self, top)
        self.top = top
        self.top.geometry("1300x500")
        self.conn = conn
        self.app=app
        self.cantitate=0
        self.data=""
        cur = self.conn.cursor()
        command = """
                       select id_tranzactie,id_piesa,tip_tranzactie,to_char(data_tranzactie, 'dd/mm/yyyy'),cantitate_tranzactionata from tranzactii order by data_tranzactie,id_tranzactie"""
        cur.execute(command)
        row = cur.fetchall()
        label = Label(self.top, text="     Tranzactii", font=("Arial", 30)).grid(row=0, columnspan=2,column=0)
        cols = ('ID tranzactie', 'ID piesa', 'Tip tranzactie',"Data tranzactie","Cantitate tranzactionata")
        self.listBox = ttk.Treeview(self.top, columns=cols, show='headings')
        for col in cols:
            self.listBox.heading(col, text=col)
        self.listBox.grid(row=3, column=0, columnspan=2)
        for i in range(0, len(row)):
            self.listBox.insert("", "end", values=(row[i][0], row[i][1], row[i][2],row[i][3],row[i][4]))
        refresh_BTN = Button(top, text="Refresh", width=15, command=lambda: self.refresh()).grid(row=0,column=1)
        update_BTN = Button(top, text="Update", width=15, command=lambda: self.creare_GUI_tranzactii()).grid(row=9,column=1)
        delete_BTN = Button(top, text="Delete", width=15, command=lambda: self.sterge_tranzactii()).grid(row=10,column=1)
        commit_BTN = Button(top, text="Commit", width=15,command=lambda: self.conn.commit()).grid(row=9, column=2)
        rollback_BTN = Button(top, text="Rollback", width=15, command=lambda: self.conn.rollback()).grid(row=9,column=3)

    def refresh(self,*args):
        for i in self.listBox.get_children():
            self.listBox.delete(i)
        cur = self.conn.cursor()
        command = """
                               select id_tranzactie,id_piesa,tip_tranzactie,to_char(data_tranzactie, 'dd/mm/yyyy'),cantitate_tranzactionata from tranzactii order by data_tranzactie,id_tranzactie"""
        cur.execute(command)
        row = cur.fetchall()
        for i in range(0, len(row)):
            self.listBox.insert("", "end", values=(row[i][0], row[i][1], row[i][2],row[i][3],row[i][4]))

    def sterge_tranzactii(self,*args):
        try:
            index = self.listBox.focus()
            valoare = self.listBox.item(index)['values']
            id_tranzactie=valoare[0]
            id_piesa=valoare[1]
            data_tranzactie=valoare[3]
            tip_tranzactie=valoare[2]
            cur = self.conn.cursor()

            try:
                command = """
                                                                                                            select tip_tranzactie,to_char(data_tranzactie, 'yyyy/mm/dd'),cantitate_tranzactionata,id_tranzactie
                                                                                                                from tranzactii 
                                                                                                                    where id_piesa=""" + str(id_piesa) + """
                                                                                                                     order by data_tranzactie,tip_tranzactie"""

                cur.execute(command)
                row = cur.fetchall()
                stocuri = row

                data = data_tranzactie
                ordine = data.split("/")
                data = ordine[2] + "/" + ordine[1] + "/" + ordine[0]
                cantitate_ceruta = valoare[4]
                cantitate_stoc = 0
                for stoc in stocuri:
                    if (stoc[1] <= data):
                        if (stoc[0] == "I"):
                            cantitate_stoc += stoc[2]
                        else:
                            cantitate_stoc -= stoc[2]
                        if (cantitate_stoc < 0):
                            raise Exception("cantitate insuficienta in stoc")
                if(tip_tranzactie=="I"):
                    cantitate_stoc -= cantitate_ceruta
                else:
                    cantitate_stoc += cantitate_ceruta
                if (cantitate_stoc < 0):
                    raise Exception("cantitate insuficienta in stoc")
                for stoc in stocuri:
                    if (stoc[1] > data):
                        if (stoc[0] == "I"):
                            cantitate_stoc += stoc[2]
                        else:
                            cantitate_stoc -= stoc[2]
                        if (cantitate_stoc < 0):
                            raise Exception("cantitate insuficienta in stoc")
                command = """
                                                 select cantitate from piese where id_piesa=""" + str(id_piesa)
                cur.execute(command)
                row = cur.fetchall()
                cantitate_stoc = row[0][0]

                if (valoare[2] == "I"):
                    cantitate_stoc = cantitate_stoc - valoare[4]
                else:
                    cantitate_stoc = cantitate_stoc + valoare[4]

                cur = self.conn.cursor()
                command = """
                                                       update piese
                                                        SET cantitate = """ + str(cantitate_stoc) + """
                                                            WHERE id_piesa = """ + str(id_piesa)
                cur.execute(command)
                cur = self.conn.cursor()
                command = """
                                               delete from tranzactii where id_tranzactie=""" + str(id_tranzactie)
                cur.execute(command)
                self.refresh()
                self.app.search()
            except Exception as e:
                print(str(e))
                messagebox.showerror("Error", "Cantitate insuficienta")
        except:
            messagebox.showerror("Error", "Nu ati selectat nici un produs")


    def creare_GUI_tranzactii(self, *args):
        try:
            index = self.listBox.focus()
            valoare = self.listBox.item(index)['values']
            nume = valoare[0]
            top = Tk()
            top.title("Update Tranzactii")
            app = Modificare_Tranzactii(top, self.conn, self)
            app.mainloop()
        except:
            messagebox.showerror("Error", "Nu ati selectat un produs")
            return


    def update_tranzactii(self,*args):
        # iau id piesei si tranzactiei
        index = self.listBox.focus()
        valoare = self.listBox.item(index)['values']

        id_tranzactie = valoare[0]
        id_piesa = valoare[1]
        tip_tranzactie=valoare[2]
        # iau toate tranzactiile inafara de cea care se doreste a fi modificata
        cur = self.conn.cursor()
        command = """
                                                                                    select tip_tranzactie,to_char(data_tranzactie, 'yyyy/mm/dd'),cantitate_tranzactionata,id_tranzactie
                                                                                        from tranzactii where id_piesa=""" + str(
            id_piesa) + """ and id_tranzactie<>""" + str(id_tranzactie) + """ order by data_tranzactie"""

        cur.execute(command)
        row = cur.fetchall()
        stocuri = row

        # se ia noua data si cantitate
        data = self.data
        aux=data
        data = data[1:]
        data = data[:-1]
        ordine = data.split("/")
        data = ordine[2] + "/" + ordine[1] + "/" + ordine[0]
        cantitate_ceruta = self.cantitate
        cantitate_stoc=0
        # se testeaza daca tranzactiile raman stabile dupa modificare
        if tip_tranzactie=="O":
            if (len(stocuri) == 0):
                raise Exception("cantitate insuficienta in stoc")
        for stoc in stocuri:
            if (stoc[1] <= data):
                if (stoc[0] == "I"):
                    cantitate_stoc += stoc[2]
                else:
                    cantitate_stoc -= stoc[2]
                if (cantitate_stoc < 0):
                    raise Exception("cantitate insuficienta in stoc")
        if(tip_tranzactie=="O"):
            cantitate_stoc -= cantitate_ceruta
        else:
            cantitate_stoc +=cantitate_ceruta
        if (cantitate_stoc < 0):
            raise Exception("cantitate insuficienta in stoc")
        for stoc in stocuri:
            if (stoc[1] > data):
                if (stoc[0] == "I"):
                    cantitate_stoc += stoc[2]
                else:
                    cantitate_stoc -= stoc[2]
                if (cantitate_stoc < 0):
                    raise Exception("cantitate insuficienta in stoc")

        # se dau update tabelei tranzactii si piese(modificare stoc ) daca totul este ok

        cur = self.conn.cursor()
        command = """
                   UPDATE Tranzactii
                        SET cantitate_tranzactionata = """+str(cantitate_ceruta)+""",
                        data_tranzactie = TO_DATE("""+aux+""", 'dd/mm/yyyy')
                            WHERE id_tranzactie = """+str(id_tranzactie)

        cur.execute(command)
        cur = self.conn.cursor()
        command = """
                    UPDATE Piese
                        SET cantitate = """+str(cantitate_stoc)+"""
                            WHERE id_piesa = """+str(id_piesa)

        cur.execute(command)
        self.refresh()
        self.app.search()


class Aprovizioneaza(Frame):
    def __init__(self, top, conn,app):
        Frame.__init__(self, top)
        self.top = top
        self.top.geometry("400x200")
        self.conn = conn
        self.app=app
        label = Label(self.top, text="     Aprovizionare", font=("Arial", 20)).grid(row=0,columnspan=2,column=1)
        index=self.app.listBox.focus()
        valoare=self.app.listBox.item(index)['values']
        nume=valoare[0]
        label = Label(self.top, text=nume, font=("Arial", 15)).grid(row=1,column=2)
        label = Label(self.top, text="cantitate", font=("Arial", 15)).grid(row=2, column=1)
        self.search_box_cantitate = Entry(self.top, width=20)
        self.search_box_cantitate.grid(row=2, column=2)
        label = Label(self.top, text="Data", font=("Arial", 15)).grid(row=3, column=1)
        self.search_box_data = Entry(self.top, width=20)
        today = date.today()
        data = today.strftime("%d/%m/%Y")
        self.search_box_data.insert(0,data)
        self.search_box_data.grid(row=3, column=2)
        aprovizionare_BTN = Button(top, text="Aprovizioneaza", width=15,command=lambda: self.button()).grid(row=4, column=2)


    def button(self):
        try:
            self.app.cantitate = int(self.search_box_cantitate.get())

            try:
                self.app.data="'"
                self.app.data += self.search_box_data.get()
                self.app.data+="'"
                if(self.app.data=="''"):
                    raise Exception
                try:
                    self.app.aprovizionare()
                except:
                    if(self.app.cantitate>999):
                        messagebox.showerror("Error", "Cantitate prea mare")
                    else:
                        messagebox.showerror("Error", "data este in viitor sau scrisa gresit")
                    return
            except:
                messagebox.showerror("Error", "Nu ai introdus data")
                return
        except:
            messagebox.showerror("Error", "Nu ai introdus cantitatea")
            return
class Cumpara(Frame):
    def __init__(self, top, conn,app):
        Frame.__init__(self, top)
        self.top = top
        self.top.geometry("450x200")
        self.conn = conn
        self.app=app
        label = Label(self.top, text="     Cumpara", font=("Arial", 30)).grid(row=0, columnspan=2,column=1)
        index=self.app.listBox.focus()
        valoare=self.app.listBox.item(index)['values']
        nume=valoare[0]
        label = Label(self.top, text=nume, font=("Arial", 15)).grid(row=1,column=2)
        label = Label(self.top, text="cantitate", font=("Arial", 15)).grid(row=2,column=1)
        self.search_box_cantitate = Entry(self.top, width=20)
        self.search_box_cantitate.grid(row=2, column=2)
        label = Label(self.top, text="Data", font=("Arial", 15)).grid(row=3, column=1)
        self.search_box_data = Entry(self.top, width=20)
        today = date.today()
        data = today.strftime("%d/%m/%Y")
        self.search_box_data.insert(0,data)
        self.search_box_data.grid(row=3, column=2)
        Cumparare_BTN = Button(top, text="Cumpara", width=15,command=lambda: self.button()).grid(row=4, column=2)

    def button(self):
        try:
            self.app.cantitate = int(self.search_box_cantitate.get())
            try:
                self.app.data="'"
                self.app.data += self.search_box_data.get()
                self.app.data+="'"
                if (self.app.data == "''"):
                    raise Exception
                try:
                    self.app.vanzare()
                except:
                    if (self.app.cantitate > 999):
                        messagebox.showerror("Error", "Cantitate prea mare")
                    else:
                        messagebox.showerror("Error", "data este in viitor sau scrisa gresit")
                    return
            except:
                messagebox.showerror("Error", "Nu ai introdus data")
                return
        except:
            messagebox.showerror("Error", "Nu ai introdus cantitatea")
            return


class App(Frame):

    def __init__(self, top,conn):
        Frame.__init__(self, top)
        self.top=top
        self.top.geometry("1000x400")
        self.conn=conn
        self.marci = []
        self.modele = []
        self.marca=""
        self.cantitate=0
        self.data=""
        cur = self.conn.cursor()
        command = """
                                        select distinct marca_masina
                                            from masini"""
        cur.execute(command)
        row = cur.fetchall()
        for i in range(0, len(row)):
            self.marci.append(row[i][0])

        self.marca_selection = StringVar(self.top)
        self.model_selection = StringVar(self.top)

        self.marca_selection.trace('w', self.update_options)

        self.marca_OptionMenu = OptionMenu(self.top, self.marca_selection, *self.marci)
        self.model_OptionMenu = OptionMenu(self.top, self.model_selection,'')

        self.marca_selection.set(self.marci[0])  # default value

        self.marca_OptionMenu.grid(row=0, column=0)


        self.model_OptionMenu.grid(row=0, column=1)

        self.search_box_entry = Entry(self.top, width=20)
        self.search_box_entry.grid(row=1, column=0)

        label = Label(self.top, text="Produse", font=("Arial", 30)).grid(row=2, columnspan=3)
        # create Treeview with 3 columns
        cols = ('Denumire', 'Pret', 'Cantitate')
        self.listBox = ttk.Treeview(self.top, columns=cols, show='headings')
        # set column headings
        for col in cols:
            self.listBox.heading(col, text=col)
        self.listBox.grid(row=3, column=0, columnspan=2)
        search_BTN = Button(top, text="Search", width=15,command=lambda: self.search()).grid(row=1, column=1)

        close_BTN = Button(top, text="Close", width=15,command=exit).grid(row=4, column=1)
        aprovizionare_BTN = Button(top, text="Aprovizioneaza", width=15, command=lambda: self.creare_GUI_aprovizionare()).grid(row=3, column=2)
        cumparare_BTN = Button(top, text="Cumpara", width=15,command=lambda: self.creare_GUI_vanzare()).grid(row=3, column=3)
        detalii_BTN = Button(top, text="Detalii", width=15,command=lambda: self.creare_GUI_detalii()).grid(row=3, column=4)
        commit_BTN = Button(top, text="Commit", width=15,command=lambda: self.conn.commit()).grid(row=4, column=2)
        rollback_BTN = Button(top, text="Rollback", width=15, command=lambda: self.conn.rollback()).grid(row=4,column=3)
        tranzactii_BTN = Button(top, text="Tranzactii", width=15,command=lambda: self.creare_GUI_tranzactii()).grid(row=4, column=4)

    def search(self, *args):
        for i in self.listBox.get_children():
            self.listBox.delete(i)
        self.marca = self.marca_selection.get()
        self.model = self.model_selection.get()
        self.search_box = self.search_box_entry.get()
        cur = self.conn.cursor()
        command = """

                    select piese.denumire_piesa,piese.pret_piesa,cantitate
                        from masini
                            inner join combinatii_posibile
                                on masini.id_masina=combinatii_posibile.id_masina
                            inner join piese 
                                on combinatii_posibile.id_piesa=piese.id_piesa
                            where masini.marca_masina='""" + self.marca + """' 
                                    and masini.model_masina='""" + self.model + """'
                                    and piese.denumire_piesa like '%""" + self.search_box + """ %' """
        cur.execute(command)
        row = cur.fetchall()
        for i in range(0, len(row)):
            self.listBox.insert("", "end", values=(row[i][0], row[i][1], row[i][2]))
        # for row in cur:
        # print(row)
        # print("Denumirea:",denumire," Pret:",pret," Cantitate:",cantitate)
        cur.close()


    def creare_GUI_aprovizionare(self,*args):
        try:
            index = self.listBox.focus()
            valoare = self.listBox.item(index)['values']
            nume = valoare[0]
            top = Tk()
            top.title("Aprovizionare")
            app = Aprovizioneaza(top, self.conn,self)
            app.mainloop()
        except:
            messagebox.showerror("Error", "Nu ati selectat un produs")
            return



    def creare_GUI_vanzare(self,*args):
        try:
            index = self.listBox.focus()
            valoare = self.listBox.item(index)['values']
            nume = valoare[0]
            top = Tk()
            top.title("Cumparare")
            app = Cumpara(top, self.conn,self)
            app.mainloop()
        except:
            messagebox.showerror("Error", "Nu ati selectat un produs")
            return


    def creare_GUI_detalii(self,*args):
        try:
            index = self.listBox.focus()
            valoare = self.listBox.item(index)['values']
            nume = valoare[0]
            top = Tk()
            top.title("Detalii produs")
            app = Detalii(top, self.conn,self)
            app.mainloop()
        except:
            messagebox.showerror("Error", "Nu ati selectat un produs")
            return
    def creare_GUI_tranzactii(self,*args):
        top = Tk()
        top.title("Tranzactii")
        app = Tranzactii(top, self.conn,self)
        app.mainloop()

    def aprovizionare(self,*args):
        index=self.listBox.focus()
        valoare=self.listBox.item(index)['values']
        cur = self.conn.cursor()
        command = """
                                                                        select id_piesa
                                                                            from piese where denumire_piesa='""" + valoare[0] + """'"""
        cur.execute(command)
        row = cur.fetchall()
        id=row[0][0]
        cur = self.conn.cursor()
        command="""
            INSERT INTO tranzactii(id_piesa, tip_tranzactie, data_tranzactie, cantitate_tranzactionata)
            values(
            """+str(id)+""",
            'I',
            TO_DATE("""+self.data+""", 'dd/mm/yyyy'),
            """+str(self.cantitate)+""")"""
        cur.execute(command)
        cur.close()
        cur = self.conn.cursor()
        command="""
            UPDATE piese 
		        SET piese.cantitate =(piese.cantitate+(select cantitate_tranzactionata 
												from tranzactii
													where id_tranzactie=(select MAX(tranzactii.id_tranzactie) from tranzactii)
                                                    )
                            )
			where piese.id_piesa=(select tranzactii.id_piesa
												from tranzactii
													where id_tranzactie=(select MAX(tranzactii.id_tranzactie) from tranzactii)
                                )"""
        cur.execute(command)
        cur.close()
        self.search()

    def vanzare(self, *args):
            index = self.listBox.focus()
            valoare = self.listBox.item(index)['values']
            cur = self.conn.cursor()
            command = """
                                                                            select id_piesa
                                                                                from piese where denumire_piesa='""" + \
                      valoare[0] + """'"""
            cur.execute(command)
            row = cur.fetchall()
            id = row[0][0]
            try:
                aux=1
                command = """
                                                                                            select tip_tranzactie,to_char(data_tranzactie, 'yyyy/mm/dd'),cantitate_tranzactionata,id_tranzactie
                                                                                                from tranzactii where id_piesa=""" + str(
                    id) + """ order by data_tranzactie"""

                cur.execute(command)
                row = cur.fetchall()
                stocuri = row

                data = self.data
                data=data[1:]
                data=data[:-1]
                ordine = data.split("/")
                data = ordine[2] + "/" + ordine[1] + "/" + ordine[0]
                cantitate_ceruta = self.cantitate
                cantitate_stoc = 0
                if(len(stocuri)==0):
                    raise Exception("cantitate insuficienta in stoc")
                for stoc in stocuri:
                    if (stoc[1] <= data):
                        if (stoc[0] == "I"):
                            cantitate_stoc += stoc[2]
                        else:
                            cantitate_stoc -= stoc[2]
                        if (cantitate_stoc < 0):
                            raise Exception("cantitate insuficienta in stoc")
                cantitate_stoc-=cantitate_ceruta
                if (cantitate_stoc < 0):
                    raise Exception("cantitate insuficienta in stoc")
                for stoc in stocuri:
                    if (stoc[1] > data):
                        if (stoc[0] == "I"):
                            cantitate_stoc += stoc[2]
                        else:
                            cantitate_stoc -= stoc[2]
                        if (cantitate_stoc < 0):
                            raise Exception("cantitate insuficienta in stoc")

                cur = self.conn.cursor()
                command = """
                            UPDATE piese 
                                SET piese.cantitate =(piese.cantitate-"""+str(self.cantitate)+"""
                                            )
                            where piese.id_piesa="""+str(id)
                cur.execute(command)
                cur.close()
                aux=2
                cur = self.conn.cursor()
                command = """
                            INSERT INTO tranzactii(id_piesa, tip_tranzactie, data_tranzactie, cantitate_tranzactionata)
                            values(
                            """ + str(id) + """,
                            'O',
                            TO_DATE(""" + self.data + """, 'dd/mm/yyyy'),
                            """ + str(self.cantitate) + """)"""
                cur.execute(command)
                cur.close()
                self.search()
            except Exception as e:
                cur.close()
                if(len(ordine)!=3):
                    messagebox.showerror("Error", "Data scrisa incorect")
                    return
                if aux==1:
                    messagebox.showerror("Error", "Cantitate insuficienta in stock")
                elif aux==2:
                    messagebox.showerror("Error", "Data nu poate fi in viitor")
                return




    def update_options(self, *args):

        cur=self.conn.cursor()
        command = """
                                                                select distinct model_masina
                                                                    from masini where marca_masina='""" + self.marca_selection.get() + """'"""
        cur.execute(command)
        row = cur.fetchall()
        self.modele=[]
        for i in range(0, len(row)):
            self.modele.append(row[i][0])
        self.model_selection.set(self.modele[0])

        self.model_OptionMenu['menu'].delete(0, 'end')

        for choice in self.modele:
            self.model_OptionMenu['menu'].add_command(label=choice, command=tk._setit(self.model_selection, choice))

    def selectare(self, *args):
        self.marca = self.marca_selection.get()

    def update(self, *args,piesa,aux):
        cur = self.conn.cursor()
        command = """
                    select cantitate from piese where piese.denumire_piesa= """+piesa
        cur.execute(command)
        row=cur.fetchall()
        cantitate="'"+str(row[0][0]+aux)+"'"
        print(cantitate)
        command = """
                UPDATE piese
                    SET piese.cantitate ="""+cantitate+ """where piese.denumire_piesa= """+piesa
        cur.execute(command)
        cur.close()


def main():
    CONN_INFO = {
        'host': 'bd-dc.cs.tuiasi.ro',
        'port': 1539,
        'user': 'bd062',
        'psw': 'bd062',
        'service': 'orcl'
    }
    CONN_STR = '{user}/{psw}@{host}:{port}/{service}'.format(**CONN_INFO)
    try:
        conn = cx_Oracle.connect(CONN_STR)
    except Exception as err:
        print("Error while creating the connection", err)
    else:
        print(conn.version)
        try:



                top = Tk()
                top.title("Magazin Piese-Auto")
                app=App(top,conn)
                app.mainloop()
        except Exception as err:
            print("Error while using commands", err)
        else:
            print("Command executed")
    finally:

        conn.close


if __name__ == "__main__":
    main()
