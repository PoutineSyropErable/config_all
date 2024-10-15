local dap = require('dap')
local dap_python = require('dap-python')

-- Set the path to the Python interpreter in your virtual environment
dap_python.setup('/home/francois/MainPython_Virtual_Environment/pip_venv/bin/python')

-- Optionally, you can add configurations for Python
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}", -- This will launch the currently opened file
        pythonPath = function()
            return '/home/francois/MainPython_Virtual_Environment/pip_venv/bin/python' -- Use your virtual environment's Python path
        end,
    },
}

