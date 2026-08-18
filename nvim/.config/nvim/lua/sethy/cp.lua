-- Function to run the current file with input.txt and output.txt
local function run_code_with_io()
	-- 1. Get the full path of the current active file
	local file = vim.fn.expand("%:p")

	-- 2. Get the current working directory (acts as your project root)
	local root = vim.fn.getcwd()

	-- 3. Define the paths for input and output files at the root
	local input_file = root .. "/input.txt"
	local output_file = root .. "/output.txt"

	-- 4. Check the filetype to determine how to run it
	local filetype = vim.bo.filetype
	local cmd = ""

	if filetype == "python" then
		cmd = string.format("python3 '%s' < '%s' > '%s'", file, input_file, output_file)
	elseif filetype == "cpp" then
		local output_bin = vim.fn.expand("%:p:r") -- Gets path without extension
		-- Compiles the file, and if successful, runs it with IO redirection
		cmd = string.format(
			"g++ '%s' -o '%s' && '%s' < '%s' > '%s'",
			file,
			output_bin,
			output_bin,
			input_file,
			output_file
		)
	elseif filetype == "c" then
		local output_bin = vim.fn.expand("%:p:r")
		cmd = string.format(
			"gcc '%s' -o '%s' && '%s' < '%s' > '%s'",
			file,
			output_bin,
			output_bin,
			input_file,
			output_file
		)
	elseif filetype == "javascript" then
		cmd = string.format("node '%s' < '%s' > '%s'", file, input_file, output_file)
	elseif filetype == "java" then
		cmd = string.format("java '%s' < '%s' > '%s'", file, input_file, output_file)
	else
		print("Unsupported filetype: " .. filetype)
		return
	end

	-- 5. Execute the command in a terminal split
	-- Opens a 10-line terminal at the bottom.
	-- It stays open after finishing so you can read compilation errors.
	vim.cmd("botright split | resize 10 | term " .. cmd)

	-- Optional: Automatically enter normal mode in the terminal
	-- vim.cmd("stopinsert")
end

-- Map this function to a key, for example <F5>
vim.keymap.set(
	"n",
	"<leader>'",
	run_code_with_io,
	{ desc = "Run Code with root IO files", noremap = true, silent = true }
)
