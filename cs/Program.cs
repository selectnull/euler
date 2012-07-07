using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Diagnostics;
using Euler.Problems;

namespace Euler
{
	class Program
	{
		static void Main(string[] args)
		{
			if (args.Length == 0)
				return;

			List<int> problems = new List<int>();
			foreach (string parsed_arg in args[0].Split(','))
			{
				if (parsed_arg.Contains("-"))
				{
					int lower;
					int upper;
					int.TryParse(parsed_arg.Split('-')[0], out lower);
					int.TryParse(parsed_arg.Split('-')[1], out upper);
					for (int i = lower; i <= upper; i++)
						problems.Add(i);
				}
				else
				{
					problems.Add(int.Parse(parsed_arg));
				}
			}

			var asm = Assembly.GetExecutingAssembly();

			foreach (int problem_number in problems)
			{
				Type type = asm.GetType(string.Format("Euler.Problems.Problem{0}", problem_number));
				if (type != null)
				{
					IProblem problem = Activator.CreateInstance(type) as IProblem;

					Stopwatch sw = new Stopwatch();
					sw.Start();
					string solution = problem.Solve();
					sw.Stop();
					Console.WriteLine(string.Format("Problem {0} solved in {2} - Solution: {1}", problem_number, solution, sw.Elapsed));

					string answer = problem.Answer();
					if (!string.IsNullOrEmpty(answer) && answer != solution)
						Console.WriteLine(string.Format("Expected answer is {0}", problem.Answer()));
				}
				else
				{
					Console.WriteLine(string.Format("Problem {0} is not solved yet.", problem_number));
				}
			}
		}
	}
}
