using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Euler.Problems
{
	class Problem1: IProblem
	{
		public string Solve()
		{
			int result = 0;
			for (int i = 1; i < 1000; i++)
				if ((i % 3 == 0) || (i % 5 == 0))
					result += i;

			return result.ToString();
		}

		public string Answer()
		{
			return "233168";
		}
	}
}
