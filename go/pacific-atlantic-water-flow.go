import (
	"fmt"
)

func pacificAtlantic(heights [][]int) [][]int {
	// TODO
	canReachPacific := make([][]bool, len(heights)) // top + left
	canReachPacific[0] = make([]bool, len(heights[0]))
	for i := 0; i < len(canReachPacific); i++ {
		canReachPacific[i] = make([]bool, len(heights[i]))
		canReachPacific[i][0] = true
	}
	for i := 0; i < len(canReachPacific[0]); i++ {
		canReachPacific[0][i] = true
	}
	for i := 1; i < len(canReachPacific); i++ {
		for j := 1; j < len(canReachPacific[i]); j++ {
			if canReachPacific[i - 1][j] && heights[i][j] >= heights[i - 1][j] {
				canReachPacific[i][j] = true
			} else if canReachPacific[i][j - 1] && heights[i][j] >= heights[i][j - 1] {
				canReachPacific[i][j] = true
			}
		}
	}

	fmt.Println(canReachPacific)
	fmt.Println("===")

	canReachAtlantic := make([][]bool, len(heights)) // bottom + right
	for i := 0; i < len(canReachAtlantic); i++ {
		canReachAtlantic[i] = make([]bool, len(heights[i]))
		canReachAtlantic[i][len(canReachAtlantic[i]) - 1] = true
	}
	for i := 0; i < len(canReachAtlantic); i++ {
		canReachAtlantic[len(canReachAtlantic) - 1][i] = true
	}


	fmt.Println(canReachAtlantic)
	
	return [][]int{};
}

