using System;
using System.IO;

namespace LoginSystemExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Login System Example");

            while (true)
            {
                Console.Write("Enter username: ");
                string username = Console.ReadLine();

                Console.Write("Enter password: ");
                string password = Console.ReadLine();

                if (Authenticate(username, password))
                {
                    Console.WriteLine("Login successful!");
                    SaveUserData(username, password);
                }
                else
                {
                    Console.WriteLine("Login failed. Invalid credentials.");
                }

                Console.WriteLine();
            }
        }

        static bool Authenticate(string username, string password)
        {
            // Basic authentication logic (not secure)
            // Replace with more secure authentication mechanisms
            return username == "user" && password == "password";
        }

        static void SaveUserData(string username, string password)
        {
            string filePath = $"{username}.txt";

            using (StreamWriter writer = new StreamWriter(filePath))
            {
                writer.WriteLine("Username: " + username);
                writer.WriteLine("Password: " + password);
            }

            Console.WriteLine("User data saved to " + filePath);
        }
    }
}
