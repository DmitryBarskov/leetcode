class Solution:
    """
    >>> Solution().numberOfBeams(["011001","000000","010100","001000"])
    8
    >>> Solution().numberOfBeams(["000","111","000"])
    0
    """

    def numberOfBeams(self, bank: list[str]) -> int:
        laser_beams = 0
        devices_in_previous_row = 0
        for row in bank:
            devices_in_row = 0
            for cell in row:
                if cell == '1':
                    devices_in_row += 1
            if devices_in_row == 0:
                continue
            laser_beams += devices_in_row * devices_in_previous_row
            devices_in_previous_row = devices_in_row
        return laser_beams
