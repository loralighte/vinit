// V Init script
// License: MIT
// Author: Kai Lyons

module main 

import os

fn main(){
	project := {
		"project_name": os.input("Project Name: "),
		"project_desc": os.input("Project Description: "),
		"project_vers": os.input("Project Version: "),
		"project_repo": os.input("Project Repo: ")
	}
	os.mkdir(project["project_name"]) ?
	mut vmod := os.open_file("${project["project_name"]}/v.mod", "w") ?
	vmod.write("Module { \n".bytes()) ?
	vmod.write("\tname: \"${project["project_name"]}\"\n".bytes()) ?
	vmod.write("\tdescription: \"${project["project_desc"]}\"\n".bytes()) ?
	vmod.write("\tversion: \"${project["project_vers"]}\"\n".bytes()) ?
	vmod.write("\trepo_url: \"${project["project_repo"]}\"\n".bytes()) ?
	vmod.write("}".bytes()) ? 
	vmod.close()
	os.create("${project["project_name"]}/LICENSE") ?
	mut readme := os.open_file("${project["project_name"]}/README.md", "w") ?
	readme.write("# ${project["project_name"]}\n".bytes()) ?
	readme.write("${project["project_desc"]} \n \n".bytes()) ?
	readme.write("version: `${project["project_vers"]}`\n".bytes()) ?
	readme.close()
	mut vfile := os.open_file("${project["project_name"]}/${project["project_name"]}.v", "w") ?
	vfile.write("module main\n\n".bytes()) ?
	vfile.write("fn main() { \n".bytes()) ?
	vfile.write("\t// Insert program code here!\n".bytes()) ?
	vfile.write("\tprintln(\"Hello, world!\")\n".bytes()) ?
	vfile.write("}".bytes()) ?
	vfile.close()
}