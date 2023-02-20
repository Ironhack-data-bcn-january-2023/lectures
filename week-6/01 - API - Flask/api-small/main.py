from flask import Flask, jsonify, request
import random
import tools.sql_queries as sql


app = Flask (__name__)

@app.route("/", methods=["GET"])
def hello_this_works ():
    return f"API does work"

@app.route("/table/<table_queried>")
def function_to_get_all_of_it (table_queried):
    return jsonify(sql.get_everything_table(table_queried))

# REQUEST (python / browser)
    # TRIGGER: function defined on main.py  
        # that will call tools.sql_queries
            # that function uses the engine on config.sql_connection

@app.route("/hello-world")
def hello ():
    return f"Hello world!"

@app.route("/random/<therange>")
def random_number (therange):
    therange = int(therange)
    return str(random.randint(0, therange))

@app.route("/campus/<location>")
def campus_location (location):
    if location == "barcelona":
        return "Carrer de Pamplona, 96"
    elif location == "madrid":
        return "Paseo de la chopera, 14"

# POST THINGS INTO SQL
@app.route("/insert/<the_table>/<d_id>/<name>", methods = ["POST"])
def insert_into_table (the_table, d_id, name):
    sql.insert_one(the_table, d_id, name)
    return "Inserted!"

@app.route("/insert-into-employees", methods=["GET"])
def insert_by_passing_params ():

    id_ = request.args["id_"] # params.id_ = {}
    date = request.args["date"]
    name = request.args["name"] 
    fname = request.args["fname"] 
    gender = request.args["gender"] 
    date_2 = request.args["date_2"] 

    sql.insert_params (id_, date, name, fname, gender, date_2)
    return "ok"


if __name__ == "__main__": #this prevents the moduel from being 
    # accidentally run when imported
    # makes sure its either module or script
    app.run(debug=True)