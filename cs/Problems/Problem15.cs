using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Euler.Problems
{
	class Problem15: IProblem
	{
		private const int MaxPoint = 20;

		private Int64 WalkThePath(int x, int y, Int64 result)
		{
			if (x < MaxPoint)
				result = WalkThePath(x + 1, y, result);
			if (y < MaxPoint)
				result = WalkThePath(x, y + 1, result);

			if (x == MaxPoint && y == MaxPoint)
				return result + 1;

			return result;
		}

		public string Solve()
		{
			return WalkThePath(0, 0, 0).ToString();
		}

		public string Answer()
		{
			return "137846528820";
		}
	}
}
