# pip install Flask, flask_mysqldb
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)

# Session
app.secret_key = 'mysecretkey'

# MySQL Conn
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'crud_flask'

try:
    mysql = MySQL(app)
except:
    print("Error trying to connect to the database. Is it available, or are the parameters correct?")
    exit()

@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute("CALL sp_selectAll")
    data = cur.fetchall()
    return render_template('index.html', contacts = data)

@app.route('/add', methods=["POST"])
def add_contact():
    if request.method == 'POST':
        name = request.form['name']
        lastName = request.form['lastName']
        phone = request.form['phone']
        address = request.form['address']

        try:
            cur = mysql.connection.cursor()
            cur.execute(f"CALL sp_add('{name}', '{lastName}', '{phone}', '{address}');")
            mysql.connection.commit()

            flash('Contact added succesfully')
        except Exception as e:
            print('Error: ', e)
        return redirect(url_for('Index'))

@app.route('/edit/<id>')
def get_contact(id):
    cur = mysql.connection.cursor()
    cur.execute(f"CALL sp_selectById({id});")
    data = cur.fetchone()
    return render_template('edit_contact.html', contact = data)

@app.route('/delete/<string:id>')
def delete(id):
    try:
        cur = mysql.connection.cursor()
        cur.execute(f"CALL sp_delete({id});")
        mysql.connection.commit()
        flash("Contact deleted succesfully")
    except Exception as e:
        print("Error: ", e)

    return redirect(url_for('Index'))

@app.route('/update/<id>', methods = ["POST"])
def update(id):
    if request.method == 'POST':
        name = request.form['name']
        lastName = request.form['lastName']
        phone = request.form['phone']
        address = request.form['address']
        
        try:
            cur = mysql.connection.cursor()
            cur.execute(f"CALL sp_update('{name}', '{lastName}', '{phone}', '{address}', '{id}');")
            mysql.connection.commit()
            flash("Contact edited succesfully")
        except Exception as e:
            print('Error: ', e)
        return redirect(url_for('Index'))

if __name__ == '__main__':
    app.run(port=3000, debug=True)