require('competitest').setup {
    testcases_directory = ".competitest",
    testcases_use_single_file = true,
    template_file = "~/Documents/templates/template.$(FEXT)",
    evaluate_template_modifiers = true,
     received_contests_directory = "$(HOME)/cp/$(JUDGE)/$(CONTEST)",
    received_contests_prompt_directory = false,
    received_contests_prompt_extension = false,
    compile_command = {
        c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        cpp = { exec = "g++", args = { "-std=c++20" , "-Wall", "-O0", "-g3", "-fsanitize=address", "$(FNAME)", "-o", "$(FNOEXT)" } },
        rust = { exec = "rustc", args = { "$(FNAME)" } },
        java = { exec = "javac", args = { "$(FNAME)" } },
    },
}
