require('competitest').setup {
    testcases_directory = ".competitest",
    testcases_use_single_file = true,
    compile_command = {
        c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        cpp = { exec = "g++", args = { "-Wall", "-O0", "-g3", "-fsanitize=address", "$(FNAME)", "-o", "$(FNOEXT)" } },
        rust = { exec = "rustc", args = { "$(FNAME)" } },
        java = { exec = "javac", args = { "$(FNAME)" } },
    },
}
