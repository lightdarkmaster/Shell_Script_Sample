import subprocess

def main():
    print("Running C# Login System Example")
    
    # Compile the C# program
    compile_command = ["csc", "LoginSystemExample.cs"]
    subprocess.run(compile_command)
    
    # Run the compiled C# program
    run_command = ["mono", "LoginSystemExample.exe"]
    subprocess.run(run_command)
    
    print("C# program execution completed")

if __name__ == "__main__":
    main()
