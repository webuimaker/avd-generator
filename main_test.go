package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

type fakeClock struct{}

func (fakeClock) Now() string {
	return "2021-04-15T20:55:39Z"
}

func TestGetAllFiles(t *testing.T) {
	actual, err := GetAllFiles("goldens/json/nvd")
	require.NoError(t, err)
	assert.Equal(t, []string{"goldens/json/nvd/CVE-2020-0001.json", "goldens/json/nvd/CVE-2020-0002.json", "goldens/json/nvd/CVE-2020-11932.json"}, actual)
}
